import 'package:flutter/material.dart';

/// Widget AppBar custom với 2 icon (left & right)
class CustomTopBar extends StatelessWidget {
  final VoidCallback? onBackPressed;
  final VoidCallback? onMenuPressed;

  const CustomTopBar({super.key, this.onBackPressed, this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Spacer(), _circleIconWithEditMenu(Icons.more_horiz)],
          ),
        ),
      ),
    );
  }
}

/// Biểu tượng tròn reusable
Widget _circleIconWithEditMenu(IconData icon) {
  return MenuAnchor(
    builder: (context, controller, child) {
      return GestureDetector(
        onTap: () {
          if (controller.isOpen) {
            controller.close();
          } else {
            controller.open();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(color: Colors.black, width: 2),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(icon, size: 20, color: Colors.black87),
        ),
      );
    },
    menuChildren: [
      MenuItemButton(
        onPressed: () {
          // TODO: mở màn hình edit hoặc dialog
          print("Edit clicked");
        },
        child: const Text(
          'Edit',
          style:  TextStyle(
            color: Colors.black87, // hoặc Colors.white / màu bạn muốn
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  );
}
