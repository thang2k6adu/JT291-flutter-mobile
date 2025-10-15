import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/menu_item.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: const [
          CustomMenuItem(
            icon: Icons.video_library,
            title: 'My posts',
          ),
          CustomMenuItem(
            icon: Icons.backpack_outlined,
            title: 'My backpack',
          ),
          CustomMenuItem(
            icon: Icons.groups_outlined,
            title: 'Task clans',
          ),
          CustomMenuItem(
            icon: Icons.people_outline,
            title: 'My referral',
          ),
          SizedBox(height: 12),
          CustomMenuItem(
            icon: Icons.headset_mic_outlined,
            title: 'Customer Service',
          ),
          CustomMenuItem(
            icon: Icons.help_outline,
            title: 'Help center',
          ),
          CustomMenuItem(
            icon: Icons.feedback_outlined,
            title: 'Feedback',
          ),
          CustomMenuItem(
            icon: Icons.article_outlined,
            title: 'Contract Us',
          ),
        ],
      ),
    );
  }
}