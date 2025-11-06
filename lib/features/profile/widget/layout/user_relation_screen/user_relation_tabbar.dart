import 'package:flutter/material.dart';

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
        Tab(text: 'Following ($followingUsersCount)'),
        Tab(text: 'Followers ($followersUsersCount)'),
        Tab(text: 'Friends ($friendsUsersCount)'),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}
