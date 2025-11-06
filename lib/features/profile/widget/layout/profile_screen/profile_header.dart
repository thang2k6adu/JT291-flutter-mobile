import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/stat_item.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class ProfileHeader extends StatelessWidget {
  final String avatarUrl;
  final int followingCount;
  final int followersCount;
  final int viewsCount;
  final VoidCallback? onAvatarTap;

  const ProfileHeader({
    super.key,
    required this.avatarUrl,
    required this.followingCount,
    required this.followersCount,
    required this.viewsCount,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Avatar
          GestureDetector(
            onTap: onAvatarTap,
            child: CircleAvatar(
              radius: 40,
              backgroundImage: avatarUrl.isNotEmpty
                  ? NetworkImage(avatarUrl)
                  : null,
              backgroundColor: Colors.grey.shade200,
              child: avatarUrl.isEmpty
                  ? const Icon(Icons.person, size: 40, color: Colors.grey)
                  : null,
            ),
          ),

          // Stats
          StatItem(count: followingCount.toString(), label: 'Following'),
          StatItem(count: followersCount.toString(), label: 'Followers'),

          // Views with optional badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              StatItem(icon: Image.asset(AppIcons.eyePng), label: 'Views'),
              if (viewsCount > 0)
                Positioned(
                  right: -6,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$viewsCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
