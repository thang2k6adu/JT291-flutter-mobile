import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/menu_item.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      MenuItemModel(icon: Icons.video_library, title: 'My posts'),
      MenuItemModel(icon: Icons.backpack_outlined, title: 'My backpack'),
      MenuItemModel(icon: Icons.groups_outlined, title: 'Task clans'),
      MenuItemModel(icon: Icons.people_outline, title: 'My referral'),
      null, // <-- nhóm ngăn cách
      MenuItemModel(
        icon: Icons.headset_mic_outlined,
        title: 'Customer Service',
      ),
      MenuItemModel(icon: Icons.help_outline, title: 'Help center'),
      MenuItemModel(icon: Icons.feedback_outlined, title: 'Feedback'),
      MenuItemModel(icon: Icons.article_outlined, title: 'Contact Us'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          for (final item in menuItems)
            if (item == null)
              const SizedBox(height: 12)
            else
              CustomMenuItem(
                icon: item.icon,
                title: item.title,
                onTap: item.onTap,
              ),
        ],
      ),
    );
  }
}

class MenuItemModel {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const MenuItemModel({required this.icon, required this.title, this.onTap});
}
