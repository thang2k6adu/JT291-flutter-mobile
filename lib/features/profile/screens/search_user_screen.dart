import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/components/ui/app_search_field.dart';
import 'package:jt291_flutter_mobile/components/ui/no_results_widget.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/core/mixins/scroll_pagination_mixin.dart';
import 'package:jt291_flutter_mobile/core/mixins/search_with_debounce_mixin.dart';
import 'package:jt291_flutter_mobile/data/providers/search/search_user_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/social_connection_manager_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/search_user_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_relation_model.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/user_relation_screen.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/user_item_widget.dart';

class SearchUserScreen extends ConsumerStatefulWidget {
  const SearchUserScreen({super.key});

  @override
  ConsumerState<SearchUserScreen> createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends ConsumerState<SearchUserScreen>
    with ScrollPaginationMixin, SearchWithDebounceMixin {
  final TextEditingController _searchController = TextEditingController();

  @override
  Future<void> Function() get onLoadMore => () async {
    await ref.read(searchUserProvider.notifier).loadMore();
  };

  @override
  bool Function() get hasNext => () => ref.read(searchUserProvider.notifier).hasNext;

  @override
  bool Function() get isLoadingMore => () => ref.read(searchUserProvider.notifier).isLoadingMore;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchUserProvider.notifier).fetchData(reset: true).then((_) {
        checkLoadMoreIfListNotFull();
      });
    });
  }

  @override
  void onSearchDebounced(String query) async {
    print('Search query: $query');
    await ref
        .read(searchUserProvider.notifier)
        .fetchData(reset: true, search: query);

    checkLoadMoreIfListNotFull();
  }

  void _handleUserButtonPressed(UserRelationItem user, UserButtonType type) {
    // Xác định userId hiện tại (có thể lấy từ auth provider)
    final currentUserId = 'current_user_id'; // TODO: get from auth provider
    final controller = ref.read(searchUserControllerProvider.notifier);

    switch (type) {
      case UserButtonType.follow:
      case UserButtonType.followBack:
        controller.followUser(context, currentUserId, user.id);
        break;
      case UserButtonType.following:
      case UserButtonType.unfollow:
        controller.unfollowUser(context, currentUserId, user.id);
        break;
      case UserButtonType.friends:
        // Unfriend logic - có thể delegate sang friend provider
        break;
    }
  }

  UserButtonType _getUserButtonType(UserRelationItem user) {
    // Logic đơn giản: nếu đang follow thì hiển thị "Following", ngược lại "Follow"
    return user.isFollowing ? UserButtonType.following : UserButtonType.follow;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the central connection manager for user updates
    ref.watch(socialConnectionManagerProvider);
    
    final searchState = ref.watch(searchUserProvider);
    final searchNotifier = ref.read(searchUserProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBack(title: 'Search', bottomBorder: true),
      body: Column(
        children: [
          AppSearchField(
            controller: _searchController,
            hintText: 'Search users',
            onChanged: handleSearchChanged,
          ),
          Expanded(
            child: searchState.when(
              data: (userIds) {
                // Get full user models from central store
                final connectionManager = ref.read(socialConnectionManagerProvider.notifier);
                final users = connectionManager.getUsers(userIds);
                
                // Nếu chưa search gì (query rỗng) và list rỗng
                if (currentQuery.isEmpty && users.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, size: 64, color: Colors.grey[400]),
                        const SizedBox(height: 16),
                        Text(
                          'Search for users',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                // Nếu đã search nhưng không có kết quả
                if (currentQuery.isNotEmpty && users.isEmpty) {
                  return const NoMatchingResults();
                }

                // Hiển thị danh sách kết quả
                return RefreshIndicator(
                  onRefresh: () async {
                    await searchNotifier.refresh();
                    checkLoadMoreIfListNotFull();
                  },
                  child: ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount:
                        users.length + (searchNotifier.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < users.length) {
                        final user = users[index];
                        final userRelationItem =
                            UserRelationItem.fromFollowingModel(user);

                        return UserItemWidget(
                          user: userRelationItem,
                          isPending: user.isPending,
                          buttonType: _getUserButtonType(userRelationItem),
                          onUserButtonPressed: _handleUserButtonPressed,
                          onTap: () {
                            // Navigate đến UserMeScreen với userId
                            pushScreen(
                              context,
                              '${RouteConstants.userMe}?id=${user.id}',
                            );
                          },
                        );
                      } else {
                        // Loading indicator
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text('Error: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => searchNotifier.refresh(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
