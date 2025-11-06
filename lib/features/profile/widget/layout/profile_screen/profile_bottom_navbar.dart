import 'package:flutter/material.dart';

class ProfileBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final List<BottomNavigationBarItem> profileNavItems;
  final ImageProvider? image;
  const ProfileBottomNavBar({super.key, this.currentIndex = 0, this.onTap, required this.profileNavItems, this.image});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: onTap,
      items: profileNavItems
          .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label, activeIcon: image != null ? CircleAvatar(radius: 15, backgroundImage: image!) : null))
          .toList(),
    );
  }
}
