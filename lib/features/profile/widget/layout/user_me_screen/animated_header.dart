import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';

class AnimatedCustomTopBar extends StatelessWidget {
  final double extent;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMenuPressed;
  final String? avatarUrl;
  final String? nickname;
  final String? uid;
  final bool isMe;

  const AnimatedCustomTopBar({
    super.key,
    required this.extent,
    this.onBackPressed,
    this.onMenuPressed,
    this.avatarUrl,
    this.nickname,
    this.uid,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    const double threshold = 1;
    final bool shouldShowContent = extent >= threshold;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 0),
      // curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: shouldShowContent ? Colors.white : Colors.transparent,
      ),
      child: SafeArea(
        top: true,
        child: Container(
          height: 60,
          color: shouldShowContent ? Colors.white : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button (always visible, no animation)
                _buildBackButton(context),
                const SizedBox(width: 12),
                // User Info (avatar, nickname, uid)
                if (shouldShowContent)
                  AnimatedOpacity(
                    opacity: shouldShowContent ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: _buildUserInfo(),
                  )
                else
                  const Spacer(),
                const Spacer(),
                // Menu button (always visible)
                isMe ? _buildMenuButton(context) : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Avatar
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: ClipOval(
            child: avatarUrl != null
                ? Image.network(
                    avatarUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 20,
                        ),
                      );
                    },
                  )
                : Container(
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 6),
        // Nickname and UID
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              nickname ?? 'Unknown',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 0.5),
            Text(
              uid != null ? '@$uid' : '@unknown',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: onBackPressed ?? () => GoRouter.of(context).pop(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(color: Colors.black87, width: 2),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(Icons.arrow_back, size: 20, color: Colors.black87),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return MenuAnchor(
      builder: (contextAnchor, controller, child) {
        return GestureDetector(
          onTap: () {
            controller.isOpen ? controller.close() : controller.open();
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Colors.black87, width: 2),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(Icons.more_horiz, size: 20, color: Colors.black87),
          ),
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () {
            // Handle edit action
            GoRouter.of(context).push(RouteConstants.userSetting);
          },
          child: const Text(
            'Edit',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
