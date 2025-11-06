import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/app_search_field.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_appbar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_list_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_tabbar.dart';
import 'package:jt291_flutter_mobile/data/mocks/following_mock.dart';
import 'package:jt291_flutter_mobile/data/models/users/following_model.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_relation_model.dart';

class UserRelationScreen extends StatelessWidget {
  UserRelationScreen({super.key});

  final List<FollowingModel> followings = followingMock;

  @override
  Widget build(BuildContext context) {
    final List<UserRelationItem> followingItems = followings
        .map((following) => UserRelationItem.fromFollowingModel(following))
        .toList();

    final List<UserRelationItem> followersItems = followings
        .map((following) => UserRelationItem.fromFollowingModel(following))
        .toList();

    final List<UserRelationItem> friendsItems = followings
        .map((following) => UserRelationItem.fromFollowingModel(following))
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
            followersUsersCount: 0,
            friendsUsersCount: 0,
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
                  UserListSection(title: 'Following', users: followingItems),
                  UserListSection(title: 'Followers', users: followersItems),
                  UserListSection(title: 'Friends', users: friendsItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
