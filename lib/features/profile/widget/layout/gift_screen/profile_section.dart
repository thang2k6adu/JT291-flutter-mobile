import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class ProfileSectionWidget extends StatelessWidget {
  final dynamic user;

  const ProfileSectionWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final level = user.level;
    final currentLevel = level?.currentLevel ?? 0;
    final currentExp = level?.currentExp ?? 0;
    final nextLevelExp = level?.nextLevelExp ?? 50;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: User Detail (Column)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar
                AvatarWidget(
                  image: user.avatar.isNotEmpty
                      ? NetworkImage(user.avatar)
                      : const AssetImage('assets/images/default_avatar.png')
                            as ImageProvider,
                  size: 62,
                  borderWidth: 1.38,
                  showGlow: true,
                ),
                const SizedBox(height: 12),
                // User Info
                Text(
                  user.nickname,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.bio ?? 'Help me light up the Gift Wall.',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Right: Level Badge
          Column(
            children: [
              Image.asset(AppIcons.badge1Png, width: 74, height: 74),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.yellow, size: 16),
                  Text(
                    '$currentExp/$nextLevelExp',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                'Level $currentLevel',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}