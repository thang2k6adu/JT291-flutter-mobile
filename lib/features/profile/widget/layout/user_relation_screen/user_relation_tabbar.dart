import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/user_relation_screen.dart';
import 'package:jt291_flutter_mobile/core/utils/string_utils.dart';
import 'package:jt291_flutter_mobile/core/utils/number_utils.dart';
class UserRelationTabBar extends StatelessWidget implements PreferredSizeWidget {
  final int followingUsersCount;
  final int followersUsersCount;
  final int friendsUsersCount;

  const UserRelationTabBar({super.key, required this.followingUsersCount, required this.followersUsersCount, required this.friendsUsersCount});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.black,
      indicatorWeight: 2,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      tabs: [
        Tab(text: '${UserTab.following.name.capitalize()} ${convertToCompactFormNumber(followingUsersCount)}'),
        Tab(text: '${UserTab.followers.name.capitalize()} ${convertToCompactFormNumber(followersUsersCount)}'),
        Tab(text: '${UserTab.friends.name.capitalize()} ${convertToCompactFormNumber(friendsUsersCount)}'),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
