import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/locked_badge.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/svg-icon.dart';

class UserProfileSection extends StatelessWidget {
  final String? nickname;
  final String? gender;
  final int? currentLevel;
  final int? following;
  final int? followers;

  const UserProfileSection({
    super.key,
    this.nickname,
    this.gender,
    this.currentLevel,
    this.following,
    this.followers,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Hàng 1: Tên + Shield + LockedBadge
          Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.3,
                ),
                child: Text(
                  nickname ?? 'Unknown User',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              // Hiển thị icon phù hợp theo giới tính
              SvgIconSimple.asset(
                AppIcons.male,
                color: Color(0xFF0000FF),
                size: 14,
              ),
              const SizedBox(width: 8),
              const LockedBadge(iconSize: 18),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${following ?? 0}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 4),
              Text(
                'Following',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '${followers ?? 0}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 4),
              Text(
                'Followers',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
