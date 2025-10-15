import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavIcon(icon: Icons.home_outlined),
            _NavIcon(icon: Icons.grid_view_outlined),
            _NavIcon(icon: Icons.chat_bubble_outline),
            _NavIcon(icon: Icons.language),
            _ProfileNavIcon(),
          ],
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const _NavIcon({
    required this.icon,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: isActive ? Colors.blue : Colors.grey.shade600,
      size: 28,
    );
  }
}

class _ProfileNavIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade400,
            Colors.purple.shade400,
          ],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(2.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/300',
          ),
        ),
      ),
    );
  }
}