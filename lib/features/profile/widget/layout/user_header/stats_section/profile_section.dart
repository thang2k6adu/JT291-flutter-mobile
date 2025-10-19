import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/locked_badge.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/stats.dart';

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({super.key});

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
              Text(
                'Darlene Bears',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              SvgIconSimple.asset(
                AppIcons.shield,
                size: 24,
                color: Colors.blue,
              ),
              const SizedBox(width: 8),
              const LockedBadge(iconSize: 18),
            ],
          ),
          const SizedBox(height: 4),
          // Hàng 2: Followers + Following
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserStatItem(value: '360', label: 'Followers'),
              const SizedBox(width: 12),
              UserStatItem(value: '280', label: 'Following'),
            ],
          ),
        ],
      ),
    );
  }
}
