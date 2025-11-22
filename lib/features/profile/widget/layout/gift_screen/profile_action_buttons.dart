import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_relationship_model.dart';

/// Widget hiển thị action buttons trong profile
/// - Nếu isMe: không hiển thị gì
/// - Nếu chưa follow: [Follow] + [Give a gift]
/// - Nếu đã follow: [Message] + [Give a gift]
class ProfileActionButtons extends ConsumerWidget {
  final UserRelationshipModel relationship;
  final VoidCallback? onFollowPressed;
  final VoidCallback? onUnfollowPressed;
  final VoidCallback? onMessagePressed;
  final VoidCallback? onGiftPressed;

  const ProfileActionButtons({
    super.key,
    required this.relationship,
    this.onFollowPressed,
    this.onUnfollowPressed,
    this.onMessagePressed,
    this.onGiftPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Nếu là chính mình thì không hiện buttons
    if (relationship.isMe) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        children: [
          // Button Follow/Message
          Expanded(child: _buildGiftButton(context)),
          const SizedBox(width: 12),
          // Button Give a gift
          Expanded(child: _buildMainActionButton(context)),
        ],
      ),
    );
  }

  Widget _buildMainActionButton(BuildContext context) {
    if (relationship.isFollowing) {
      // Đã follow -> hiện nút Message
      return _ActionButton(
        text: 'Message',
        icon: Icons.send,
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: const [
            Color(0xFFB3A6FF),
            Color(0xFFADA5FF),
            Color(0xFF9FA2FF),
            Color(0xFF879EFF),
            Color(0xFF6599FF),
            Color(0xFF3A92FF),
            Color(0xFF0589FF),
            Color(0xFF0089FF),
          ],
          stops: const [
            0.0435, // 4.35%
            0.2377, // 23.77%
            0.4618, // 46.18%
            0.7009, // 70.09%
            0.9698, // 96.98%
            1.2387, // 123.87% -> >1 vẫn ok, sẽ normalize Flutter
            1.5076, // 150.76%
            1.5375, // 153.75%
          ],
        ),
        textColor: Colors.white,
        onPressed:
            onMessagePressed ??
            () {
              print('Message pressed');
            },
      );
    } else {
      // Chưa follow -> hiện nút Follow
      return _ActionButton(
        text: 'Follow',
        icon: Icons.person_add,
        textColor: Colors.white,
        onPressed:
            onFollowPressed ??
            () {
              print('Follow pressed');
            },
      );
    }
  }

  Widget _buildGiftButton(BuildContext context) {
    return _ActionButton(
      text: 'Give a gift',
      icon: Icons.card_giftcard,
      textColor: Colors.white,
      onPressed:
          onGiftPressed ??
          () {
            print('Gift pressed');
          },
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? backgroundColor; // dùng khi không có gradient
  final LinearGradient? gradient; // nếu muốn gradient
  final Color textColor;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.text,
    required this.icon,
    this.backgroundColor,
    this.gradient = const LinearGradient(
      colors: [Color(0xFFFB9EBA), Color(0xFFE65983)],
    ),
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(26);

    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: gradient == null ? backgroundColor ?? Colors.grey : null,
          gradient: gradient,
          borderRadius: borderRadius,
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 20, color: textColor),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
