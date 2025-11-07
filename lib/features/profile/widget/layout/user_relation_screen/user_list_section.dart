import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/utils/string_utils.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_relation_model.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/user_relation_screen.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/user_relation_screen/user_item_widget.dart';

/// Widget hiển thị danh sách user với label tab, hỗ trợ loading indicator.
/// Tất cả dữ liệu, scrollController, loadMore, isLoading đều truyền từ ngoài.
class UserListSection extends StatelessWidget {
  final String title;
  final List<UserRelationItem> users;
  final ScrollController scrollController;
  final VoidCallback onLoadMore;
  final bool isLoading;
  final void Function(UserRelationItem user, UserButtonType type)?
  onUserButtonPressed;

  const UserListSection({
    super.key,
    required this.title,
    required this.users,
    required this.scrollController,
    required this.onLoadMore,
    required this.isLoading,
    this.onUserButtonPressed,
  });

  UserButtonType getUserButtonType(String tabTitle, bool isFollowing) {
    if (tabTitle == UserTab.following.name.capitalize()) {
      return isFollowing ? UserButtonType.following : UserButtonType.follow;
    } else if (tabTitle == UserTab.followers.name.capitalize()) {
      return isFollowing ? UserButtonType.friends : UserButtonType.followBack;
    } else if (tabTitle == UserTab.friends.name.capitalize()) {
      return isFollowing ? UserButtonType.friends : UserButtonType.followBack;
    }
    return UserButtonType.follow;
  }

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
                color: Color.fromARGB(221, 36, 27, 27),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),

        Expanded(
          child: RefreshIndicator(
            onRefresh: () async => onLoadMore(),
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: users.length + (isLoading ? 1 : 0), // +1 cho loading
              itemBuilder: (context, index) {
                if (index < users.length) {
                  final user = users[index];
                  return UserItemWidget(
                    user: user,
                    buttonType: getUserButtonType(title, user.isFollowing),
                    onUserButtonPressed: onUserButtonPressed,
                  );
                } else {
                  // Đây là item cuối cùng hiển thị loading indicator
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
