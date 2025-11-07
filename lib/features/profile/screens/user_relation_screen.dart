import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/ui/app_search_field.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_appbar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_list_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_tabbar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/user_relation_screen/user_item_widget.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/following_list_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/follower_list_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/friend_list_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_relation_model.dart';
import 'package:jt291_flutter_mobile/components/ui/no_results_widget.dart';

/// Provider lưu từ khóa tìm kiếm
final searchQueryProvider = StateProvider<String>((ref) => '');

class UserRelationScreen extends ConsumerStatefulWidget {
  const UserRelationScreen({super.key});

  @override
  ConsumerState<UserRelationScreen> createState() => _UserRelationScreenState();
}

class _UserRelationScreenState extends ConsumerState<UserRelationScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _handleUserButtonPressed(UserRelationItem user, UserButtonType type) {
    switch (type) {
      case UserButtonType.friends:
        print('Open friend profile: ${user.nickname} ${user.id}');
        break;
      case UserButtonType.following:
        print('Unfollow user: ${user.nickname} ${user.id}');
        break;
      case UserButtonType.followBack:
        print('Follow back user: ${user.nickname} ${user.id}');
        break;
    }
  }


  /// Hàm helper: build UI danh sách đã lọc
  Widget buildFilteredUserList<T>({
    required List<T> list,
    required String searchQuery,
    required UserRelationItem Function(T) convertFn,
    required String title,
    required void Function(UserRelationItem, UserButtonType) onPressed,
  }) {
    // Lọc theo query — nếu query rỗng thì giữ nguyên list
    final filtered = searchQuery.isEmpty
        ? list
        : list
            .where((e) => convertFn(e)
                .nickname
                .toLowerCase()
                .contains(searchQuery.toLowerCase()))
            .toList();

    // Hiển thị kết quả
    if (filtered.isEmpty && searchQuery.isNotEmpty) {
      return const NoMatchingResults();
    }

    return UserListSection(
      title: title,
      users: filtered.map(convertFn).toList(),
      onUserButtonPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    final followingState = ref.watch(followingListProvider);
    final followerState = ref.watch(followerListProvider);
    final friendState = ref.watch(friendListProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: UserRelationAppBar(
          title: 'Darlene Bears',
          bottom: UserRelationTabBar(
            followingUsersCount: followingState.value?.length ?? 0,
            followersUsersCount: followerState.value?.length ?? 0,
            friendsUsersCount: friendState.value?.length ?? 0,
          ),
        ),
        body: Column(
          children: [
            AppSearchField(
              controller: searchController,
              hintText: 'Search users',
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // FOLLOWING TAB
                  followingState.when(
                    data: (list) => buildFilteredUserList(
                      list: list,
                      searchQuery: searchQuery,
                      convertFn: (e) => UserRelationItem.fromFollowingModel(e),
                      title: 'Following',
                      onPressed: _handleUserButtonPressed,
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, st) =>
                        Center(child: Text('Error loading Following: $e')),
                  ),

                  // FOLLOWER TAB
                  followerState.when(
                    data: (list) => buildFilteredUserList(
                      list: list,
                      searchQuery: searchQuery,
                      convertFn: (e) => UserRelationItem.fromFollowerModel(e),
                      title: 'Followers',
                      onPressed: _handleUserButtonPressed,
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, st) =>
                        Center(child: Text('Error loading Followers: $e')),
                  ),

                  // FRIEND TAB
                  friendState.when(
                    data: (list) => buildFilteredUserList(
                      list: list,
                      searchQuery: searchQuery,
                      convertFn: (e) => UserRelationItem.fromFriendModel(e),
                      title: 'Friends',
                      onPressed: _handleUserButtonPressed,
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, st) =>
                        Center(child: Text('Error loading Friends: $e')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
