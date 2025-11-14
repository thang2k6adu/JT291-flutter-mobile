import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/ui/app_search_field.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_appbar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_list_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_tabbar.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/following_list_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/follower_list_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/friend_list_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_relation_model.dart';
import 'package:jt291_flutter_mobile/components/ui/no_results_widget.dart';
import 'package:jt291_flutter_mobile/core/utils/string_utils.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_stats_provider.dart';

enum UserTab { following, followers, friends }

enum UserButtonType { follow, following, followBack, unfollow, friends }

/// Provider lưu từ khóa tìm kiếm
final searchQueryProvider = StateProvider<String>((ref) => '');

class UserRelationScreen extends ConsumerStatefulWidget {
  const UserRelationScreen({super.key});

  @override
  ConsumerState<UserRelationScreen> createState() => _UserRelationScreenState();
}

class _UserRelationScreenState extends ConsumerState<UserRelationScreen> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController followingScrollController = ScrollController();
  final ScrollController followerScrollController = ScrollController();
  final ScrollController friendScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _setupScrollListeners();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(followingListProvider.notifier).fetchData(reset: true);
      ref.read(followerListProvider.notifier).fetchData(reset: true);
      ref.read(friendListProvider.notifier).fetchData(reset: true);
    });
  }

  void _setupScrollListeners() {
    followingScrollController.addListener(() {
      if (followingScrollController.position.pixels >=
          followingScrollController.position.maxScrollExtent - 200) {
        ref.read(followingListProvider.notifier).loadMore();
      }
    });

    followerScrollController.addListener(() {
      if (followerScrollController.position.pixels >=
          followerScrollController.position.maxScrollExtent - 200) {
        ref.read(followerListProvider.notifier).loadMore();
      }
    });

    friendScrollController.addListener(() {
      if (friendScrollController.position.pixels >=
          friendScrollController.position.maxScrollExtent - 200) {
        ref.read(friendListProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    followingScrollController.dispose();
    followerScrollController.dispose();
    friendScrollController.dispose();
    super.dispose();
  }

  void _handleUserButtonPressed(UserRelationItem user, UserButtonType type) {
    final followingNotifier = ref.read(followingListProvider.notifier);
    final followerNotifier = ref.read(followerListProvider.notifier);
    final friendNotifier = ref.read(friendListProvider.notifier);

    switch (type) {
      case UserButtonType.follow:
        followingNotifier.followUser(user.id, user.id);
        followerNotifier.followBackUser(user.id, user.id);
        friendNotifier.followUser(user.id, user.id);
        break;
      case UserButtonType.followBack:
        followerNotifier.followBackUser(user.id, user.id);
        followingNotifier.followUser(user.id, user.id);
        friendNotifier.followUser(user.id, user.id);
        break;
      case UserButtonType.following:
        followingNotifier.unfollowUser(user.id, user.id);
        followerNotifier.unfollowUser(user.id, user.id);
        friendNotifier.unfriendUser(user.id, user.id);
        break;
      case UserButtonType.unfollow:
        followingNotifier.unfollowUser(user.id, user.id);
        followerNotifier.unfollowUser(user.id, user.id);
        friendNotifier.unfriendUser(user.id, user.id);
        break;
      case UserButtonType.friends:
        friendNotifier.unfriendUser(user.id, user.id);
        followerNotifier.unfollowUser(user.id, user.id);
        followingNotifier.unfollowUser(user.id, user.id);
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
    required ScrollController scrollController,
    required Future<void> Function() onRefresh,
    required bool isLoading,
  }) {
    // Lọc theo query — nếu query rỗng thì giữ nguyên list
    final filtered = searchQuery.isEmpty
        ? list
        : list
              .where(
                (e) => convertFn(
                  e,
                ).nickname.toLowerCase().contains(searchQuery.toLowerCase()),
              )
              .toList();

    // Hiển thị kết quả
    if (filtered.isEmpty && searchQuery.isNotEmpty) {
      return const NoMatchingResults();
    }

    return UserListSection(
      title: title,
      users: filtered.map(convertFn).toList(),
      onUserButtonPressed: onPressed,
      scrollController: scrollController,
      onRefresh: onRefresh,
      isLoading: isLoading,
    );
  }

  @override
  Widget build(BuildContext context) {
    final followingState = ref.watch(followingListProvider);
    final followerState = ref.watch(followerListProvider);
    final friendState = ref.watch(friendListProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    final userStatsAsync = ref.watch(userStatsProvider);

    final followingNotifier = ref.read(followingListProvider.notifier);
    final followerNotifier = ref.read(followerListProvider.notifier);
    final friendNotifier = ref.read(friendListProvider.notifier);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: UserRelationAppBar(
          title: 'Darlene Bears',
          bottom: UserRelationTabBar(
            followingUsersCount: userStatsAsync.value?.followingCount ?? 0,
            followersUsersCount: userStatsAsync.value?.followersCount ?? 0,
            friendsUsersCount: userStatsAsync.value?.friendsCount ?? 0,
          ),
        ),
        body: Column(
          children: [
            AppSearchField(
              controller: searchController,
              hintText: 'Search users',
              onChanged: (value) {
                // TODO: add debounce
                ref.read(searchQueryProvider.notifier).state = value;
                followingNotifier.fetchData(reset: true, search: value);
                followerNotifier.fetchData(reset: true, search: value);
                friendNotifier.fetchData(reset: true, search: value);
              },
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // FOLLOWING TAB
                  followingState.when(
                    data: (list) => buildFilteredUserList(
                      list: list,
                      scrollController: followingScrollController,
                      onRefresh: followingNotifier.refresh,
                      isLoading: followingNotifier.isLoadingMore,
                      searchQuery: searchQuery,
                      convertFn: (e) => UserRelationItem.fromFollowingModel(e),
                      title: UserTab.following.name.capitalize(),
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
                      title: UserTab.followers.name.capitalize(),
                      onPressed: _handleUserButtonPressed,
                      scrollController: followerScrollController,
                      onRefresh: followerNotifier.refresh,
                      isLoading: followerNotifier.isLoadingMore,
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
                      title: UserTab.friends.name.capitalize(),
                      onPressed: _handleUserButtonPressed,
                      scrollController: friendScrollController,
                      onRefresh: friendNotifier.refresh,
                      isLoading: friendNotifier.isLoadingMore,
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
