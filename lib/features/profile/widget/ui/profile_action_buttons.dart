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
          Expanded(
            child: _buildMainActionButton(context),
          ),
          const SizedBox(width: 12),
          // Button Give a gift
          Expanded(
            child: _buildGiftButton(context),
          ),
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
        backgroundColor: const Color(0xFF6C9EFF),
        textColor: Colors.white,
        onPressed: onMessagePressed ?? () {
          print('Message pressed');
        },
      );
    } else {
      // Chưa follow -> hiện nút Follow
      return _ActionButton(
        text: 'Follow',
        icon: Icons.person_add,
        backgroundColor: const Color(0xFFE65983),
        textColor: Colors.white,
        onPressed: onFollowPressed ?? () {
          print('Follow pressed');
        },
      );
    }
  }

  Widget _buildGiftButton(BuildContext context) {
    return _ActionButton(
      text: 'Give a gift',
      icon: Icons.card_giftcard,
      backgroundColor: const Color(0xFFFFA6C9),
      textColor: Colors.white,
      onPressed: onGiftPressed ?? () {
        print('Gift pressed');
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

