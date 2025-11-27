import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/action_button.dart';
import 'package:jt291_flutter_mobile/features/profile/models/user_relation_model.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/user_relation_screen.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
class UserItemWidget extends StatelessWidget {
  final UserRelationItem user;
  final UserButtonType buttonType;
  final void Function(UserRelationItem user, UserButtonType type)?
      onUserButtonPressed;
  final VoidCallback? onTap;
  final bool isPending;
  final bool showHeartIcon;

  const UserItemWidget({
    super.key,
    required this.user,
    required this.buttonType,
    this.onUserButtonPressed,
    this.onTap,
    this.isPending = false,
    this.showHeartIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    // Xác định UI button dựa trên type
    String buttonText;
    Color buttonBg;
    Color buttonTextColor;

    switch (buttonType) {
      case UserButtonType.friends:
        buttonText = 'Friends';
        buttonBg = const Color(0xFFF5F5F5);
        buttonTextColor = Colors.black87;
        break;
      case UserButtonType.following:
        buttonText = 'Following';
        buttonBg = const Color(0xFFF5F5F5);
        buttonTextColor = Colors.black87;
        break;
      case UserButtonType.followBack:
        buttonText = 'Follow back';
        buttonBg = const Color(0xFFE65983);
        buttonTextColor = Colors.white;
        break;
      case UserButtonType.follow:
        buttonText = 'Follow';
        buttonBg = const Color(0xFFE65983);
        buttonTextColor = Colors.white;
        break;
      case UserButtonType.unfollow:
        buttonText = 'Unfollow';
        buttonBg = const Color(0xFFF5F5F5);
        buttonTextColor = Colors.black87;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            // Avatar with heart icon overlay
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                if (showHeartIcon)
                  Positioned(
                    right: -4,
                    bottom: -4,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Image.asset(
                        AppIcons.heartCirclePng,
                        width: 18,
                        height: 18,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.favorite,
                            size: 14,
                            color: Colors.red,
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        user.nickname,
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
                        color: user.gender == 'female'
                            ? Colors.pink
                            : Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    user.bio,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Button
            ActionButton(
              isLoading: isPending,
              text:  buttonText,
              backgroundColor: buttonBg,
              textColor: buttonTextColor,
              onPressed: () => onUserButtonPressed?.call(user, buttonType),
            ),
          ],
        ),
      ),
    );
  }
}
