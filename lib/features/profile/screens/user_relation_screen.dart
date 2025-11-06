import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/app_search_field.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_appbar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_list_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_tabbar.dart';
import 'package:jt291_flutter_mobile/data/mocks/following_mock.dart';
import 'package:jt291_flutter_mobile/data/models/users/following_model.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_relation_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/follower_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/friend_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/follower_mock.dart';
import 'package:jt291_flutter_mobile/data/mocks/friend_mock.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/user_relation_screen/user_item_widget.dart';

class UserRelationScreen extends StatelessWidget {
  UserRelationScreen({super.key});

  final List<FollowingModel> followings = followingMock;
  final List<FollowerModel> followers = followerMock;
  final List<FriendModel> friends = friendMock;

  void _handleUserButtonPressed(UserRelationItem user, UserButtonType type) {
    switch (type) {
      case UserButtonType.friends:
        print('Open friend profile: ${user.nickname}' + ' ${user.id}');
        break;
      case UserButtonType.following:
        print('Unfollow user: ${user.nickname}' + ' ${user.id}');
        break;
      case UserButtonType.followBack:
        print('Follow back user: ${user.nickname}' + ' ${user.id}');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<UserRelationItem> followingItems = followings
        .map((following) => UserRelationItem.fromFollowingModel(following))
        .toList();

    final List<UserRelationItem> followersItems = followers
        .map((follower) => UserRelationItem.fromFollowerModel(follower))
        .toList();

    final List<UserRelationItem> friendsItems = friends
        .map((friend) => UserRelationItem.fromFriendModel(friend))
        .toList();

    final TextEditingController searchController = TextEditingController();

    return DefaultTabController(
      length: 3, // 3 tab: Following, Followers, Friends
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: UserRelationAppBar(
          title: 'Darlene Bears',
          bottom: UserRelationTabBar(
            followingUsersCount: followings.length,
            followersUsersCount: followers.length,
            friendsUsersCount: friends.length,
          ),
        ),
        body: Column(
          children: [
            AppSearchField(
              controller: searchController,
              hintText: 'Search users',
            ),

            // y
            Expanded(
              child: TabBarView(
                children: [
                  UserListSection(
                    title: 'Following',
                    users: followingItems,
                    onUserButtonPressed: _handleUserButtonPressed,
                  ),
                  UserListSection(
                    title: 'Followers',
                    users: followersItems,
                    onUserButtonPressed: _handleUserButtonPressed,
                  ),
                  UserListSection(
                    title: 'Friends',
                    users: friendsItems,
                    onUserButtonPressed: _handleUserButtonPressed,
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
