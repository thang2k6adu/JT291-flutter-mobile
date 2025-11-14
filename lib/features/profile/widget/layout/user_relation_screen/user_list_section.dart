import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/utils/string_utils.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_relation_model.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/user_relation_screen.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/user_item_widget.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';

/// Widget hiển thị danh sách user với label tab, hỗ trợ loading indicator.
/// Tất cả dữ liệu, scrollController, onRefresh, isLoading đều truyền từ ngoài.
///
/// Widget này có thể tái sử dụng cho nhiều màn hình khác nhau (followers, following, friends, search)
/// bằng cách truyền vào callback `getUserButtonType` tùy chỉnh hoặc sử dụng default.
class UserListSection extends StatelessWidget {
  final String title;
  final List<UserRelationItem> users;
  final ScrollController scrollController;
  final Future<void> Function() onRefresh;
  final bool isLoading;
  final void Function(UserRelationItem user, UserButtonType type)?
  onUserButtonPressed;

  /// Callback để xác định button type cho mỗi user.
  /// Nếu null, sẽ dùng logic mặc định dựa trên title.
  final UserButtonType Function(UserRelationItem user)? getUserButtonType;

  /// Có hiển thị title hay không (mặc định true)
  final bool showTitle;

  const UserListSection({
    super.key,
    required this.title,
    required this.users,
    required this.scrollController,
    required this.onRefresh,
    required this.isLoading,
    this.onUserButtonPressed,
    this.getUserButtonType,
    this.showTitle = true,
  });

  /// Logic mặc định để xác định button type dựa trên title và isFollowing
  UserButtonType _getDefaultButtonType(String tabTitle, bool isFollowing) {
    if (tabTitle == UserTab.following.name.capitalize()) {
      return isFollowing ? UserButtonType.following : UserButtonType.follow;
    } else if (tabTitle == UserTab.followers.name.capitalize()) {
      return isFollowing ? UserButtonType.unfollow : UserButtonType.followBack;
    } else if (tabTitle == UserTab.friends.name.capitalize()) {
      return isFollowing ? UserButtonType.friends : UserButtonType.followBack;
    }
    return UserButtonType.follow;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Label (chỉ hiển thị nếu showTitle = true)
        if (showTitle) ...[
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
        ],

        Expanded(
          child: RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: users.length + (isLoading ? 1 : 0), // +1 cho loading
              itemBuilder: (context, index) {
                if (index < users.length) {
                  final user = users[index];
                  // Sử dụng custom callback nếu có, ngược lại dùng logic mặc định
                  final buttonType = getUserButtonType != null
                      ? getUserButtonType!(user)
                      : _getDefaultButtonType(title, user.isFollowing);

                  return UserItemWidget(
                    isPending: user.isPending,
                    user: user,
                    buttonType: buttonType,
                    onUserButtonPressed: onUserButtonPressed,
                    onTap: () {
                      // Navigate đến UserMeScreen với userId
                      pushScreen(
                        context,
                        '${RouteConstants.userMe}?id=${user.id}',
                      );
                    },
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
