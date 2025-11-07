import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/stat_item.dart';
import 'package:jt291_flutter_mobile/core/utils/number_utils.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class ProfileHeader extends StatelessWidget {
  final String? avatarUrl;
  final int followingCount;
  final int followersCount;
  final int viewsCount;
  final VoidCallback? onAvatarTap;
  final VoidCallback? onFollowingTap; // Gesture riêng cho Following
  final VoidCallback? onFollowersTap; // Gesture riêng cho Followers
  final VoidCallback? onViewsTap; // Gesture riêng cho Views

  const ProfileHeader({
    super.key,
    required this.avatarUrl,
    required this.followingCount,
    required this.followersCount,
    required this.viewsCount,
    this.onAvatarTap,
    this.onFollowingTap,
    this.onFollowersTap,
    this.onViewsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Avatar
          GestureDetector(
            onTap: onAvatarTap,
            child: CircleAvatar(
              radius: 44,
              backgroundImage: avatarUrl?.isNotEmpty ?? false
                  ? NetworkImage(avatarUrl!)
                  : null,
              backgroundColor: Colors.grey.shade200,
              child: avatarUrl?.isEmpty ?? false
                  ? const Icon(Icons.person, size: 40, color: Colors.grey)
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          // Stats
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Following
                GestureDetector(
                  onTap: onFollowingTap,
                  child: StatItem(
                    count: convertToCompactFormNumber(followingCount),
                    label: 'Following',
                  ),
                ),

                // Followers
                GestureDetector(
                  onTap: onFollowersTap,
                  child: StatItem(
                    count: convertToCompactFormNumber(followersCount),
                    label: 'Followers',
                  ),
                ),

                // Views with optional badge
                GestureDetector(
                  onTap: onViewsTap,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      StatItem(
                        icon: Image.asset(AppIcons.eyePng),
                        label: 'Views',
                      ),
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
                              viewsCount > 99 ? '99+' : viewsCount.toString(),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
