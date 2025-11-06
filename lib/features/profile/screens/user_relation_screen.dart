import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/ui/app_search_field.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_appbar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_list_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_tabbar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/user_relation_screen/user_item_widget.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/following_list_notifier.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/follower_list_notifier.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/friend_list_notifier.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_relation_model.dart';

class UserRelationScreen extends ConsumerWidget {
  const UserRelationScreen({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followingState = ref.watch(followingListProvider);
    final followerState = ref.watch(followerListProvider);
    final friendState = ref.watch(friendListProvider);

    final TextEditingController searchController = TextEditingController();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
            ),
            Expanded(
              child: TabBarView(
                children: [
                  followingState.when(
                    data: (list) => UserListSection(
                      title: 'Following',
                      users: list
                          .map((e) => UserRelationItem.fromFollowingModel(e))
                          .toList(),
                      onUserButtonPressed: _handleUserButtonPressed,
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, st) =>
                        Center(child: Text('Error loading Following: $e')),
                  ),
                  followerState.when(
                    data: (list) => UserListSection(
                      title: 'Followers',
                      users: list
                          .map((e) => UserRelationItem.fromFollowerModel(e))
                          .toList(),
                      onUserButtonPressed: _handleUserButtonPressed,
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, st) =>
                        Center(child: Text('Error loading Followers: $e')),
                  ),
                  friendState.when(
                    data: (list) => UserListSection(
                      title: 'Friends',
                      users: list
                          .map((e) => UserRelationItem.fromFriendModel(e))
                          .toList(),
                      onUserButtonPressed: _handleUserButtonPressed,
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
