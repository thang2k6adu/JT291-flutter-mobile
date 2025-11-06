import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_relation_screen/user_relation_appbar.dart';

class UserRelationScreen extends StatelessWidget {
  const UserRelationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return DefaultTabController(
      length: 3, // 3 tab: Following, Followers, Friends
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: UserRelationAppBar(
          title: 'Darlene Bears',
          bottom: const TabBar(
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
              Tab(text: 'Following'),
              Tab(text: 'Followers'),
              Tab(text: 'Friends'),
            ],
          ),
        ),
        body: Column(
          children: [
            // 🔍 Search Bar dùng chung
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search users',
                    hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[600],
                      size: 22,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ),

            // 📋 Nội dung các tab
            const Expanded(
              child: TabBarView(
                children: [
                  _UserListTab(tabName: 'Following'),
                  _UserListTab(tabName: 'Followers'),
                  _UserListTab(tabName: 'Friends'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserListTab extends StatelessWidget {
  final String tabName;
  const _UserListTab({required this.tabName});

  @override
  Widget build(BuildContext context) {
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

    return Column(
      children: [
        // Label
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              tabName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Danh sách user
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return _buildUserItem(user);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUserItem(UserItem user) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(radius: 28, backgroundImage: AssetImage(user.avatar)),
          const SizedBox(width: 12),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      user.gender == 'female' ? Icons.female : Icons.male,
                      size: 16,
                      color:
                          user.gender == 'female' ? Colors.pink : Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  user.description,
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Following',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserItem {
  final String name;
  final String description;
  final String avatar;
  final String gender;

  UserItem({
    required this.name,
    required this.description,
    required this.avatar,
    required this.gender,
  });
}
