import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class AnimatedCustomTopBar extends StatelessWidget {
  final double extent;
  final VoidCallback? onBackPressed;
  final VoidCallback? onMenuPressed;
  final String? title;

  const AnimatedCustomTopBar({
    super.key,
    required this.extent,
    this.onBackPressed,
    this.onMenuPressed,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    const double threshold = 1;
    final bool shouldShowWhiteBackground = extent >= threshold;
    final bool shouldShowContent = extent >= threshold;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 0),
      // curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color:Colors.white,
      ),
      child: SafeArea(
        top: true,
        child: Container(
          height: 60,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button (always visible, no animation)
                _buildBackButton(context),

                // Title (simple fade in/out)
                if (shouldShowContent)
                  AnimatedOpacity(
                    opacity: shouldShowContent ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Text(
                      title ?? 'Profile',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  )
                else
                  const Spacer(),

                // Menu button (always visible)
                _buildMenuButton(context),
              ],
            ),
          ),
        ),
      ),
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
