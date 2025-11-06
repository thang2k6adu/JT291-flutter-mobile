import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/user_relation_screen/user_item_widget.dart';

/// Widget hiển thị danh sách User với label tab.
/// - [title]: Tên tab (Following, Followers, Friends)
/// - [users]: Danh sách UserItem hiển thị
class UserListSection extends StatelessWidget {
  final String title;
  final List<UserItem> users;

  const UserListSection({super.key, required this.title, required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Label
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
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
              return UserItemWidget(user: user);
            },
          ),
        ),
      ],
    );
  }
}
