import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/app_search_field.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_appbar.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_list_section.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/user_relation_screen/user_item_widget.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_tabbar.dart';

class UserRelationScreen extends StatelessWidget {
  UserRelationScreen({super.key});

  final List<UserItem> users = [
    UserItem(
      name: 'Leo Herwitz',
      description: 'Striving for excellence, embra...',
      avatar: 'assets/images/avatar1.png',
      gender: 'female',
    ),

    UserItem(
      name: 'Marley Schleifer',
      description: 'Striving for excellence, embra...',
      avatar: 'assets/images/avatar2.png',
      gender: 'male',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return DefaultTabController(
      length: 3, // 3 tab: Following, Followers, Friends
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: UserRelationAppBar(
          title: 'Darlene Bears',
          bottom: UserRelationTabBar(),
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
                  UserListSection(title: 'Following', users: users),
                  UserListSection(title: 'Followers', users: users),
                  UserListSection(title: 'Friends', users: users),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}