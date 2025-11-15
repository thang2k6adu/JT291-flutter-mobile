import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';

class SectionCard extends StatelessWidget {
  final String avatarUrl;
  final String title;
  final Widget description;
  final Widget stats;
  final double avatarSize;
  final bool showGlow;
  final LinearGradient gradient;
  final String backgroundImage;

  const SectionCard({
    super.key,
    required this.avatarUrl,
    required this.title,
    required this.description,
    required this.stats,
    this.avatarSize = 52,
    this.showGlow = false,
    this.gradient = const LinearGradient(
      colors: [Color(0xFF36E68C), Color(0xFF097446)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    this.backgroundImage = AppImages.roomBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          AvatarWidget(
            image: NetworkImage(avatarUrl),
            size: avatarSize,
            showGlow: showGlow,
            borderWidth: 0,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                description,
              ],
            ),
          ),
          const SizedBox(width: 12),
          stats,
        ],
      ),
    );
  }
}
