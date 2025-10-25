import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/icon-number-badge.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header_constants.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class StatsRow extends StatelessWidget {
  final String crownCount;
  final String diamondCount;
  final String contribution;
  final String distance;

  const StatsRow({
    super.key,
    required this.crownCount,
    required this.diamondCount,
    required this.contribution,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCrownBadge(),
        const SizedBox(width: UserHeaderConstants.badgeSpacing),
        _buildDiamondBadge(),
        const SizedBox(width: UserHeaderConstants.textSpacing),
        _buildContributionText(),
        const Spacer(),
        _buildDistanceText(context),
      ],
    );
  }

  Widget _buildCrownBadge() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFCB3126), Color(0xFFFFC432)],
        ),
        borderRadius: BorderRadius.circular(
          UserHeaderConstants.badgeBorderRadius,
        ),
      ),
      // padding: const EdgeInsets.symmetric(
      //   horizontal: UserHeaderConstants.badgePadding,
      //   vertical: UserHeaderConstants.badgeVerticalPadding,
      // ),
      child: IconNumberBadge(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 2, bottom: 2),
        icon: Transform(
          transform: Matrix4.identity()
            ..translateByVector3(Vector3(-16.0, -12, 0.0))
            ..scaleByVector3(Vector3(2.5, 2.5, 2.5)),
          child: Image.asset(AppIcons.badge1Png),
        ),
        count: crownCount,
        backgroundColor:
            Colors.transparent, // transparent vì gradient từ Container
        iconBackgroundColor: Colors.transparent,
        iconSize: UserHeaderConstants.iconSize,
        gap: UserHeaderConstants.iconGap,
        minWidth: UserHeaderConstants.minBadgeWidth,
      ),
    );
  }

  Widget _buildDiamondBadge() {
    return IconNumberBadge(
      icon: Transform(
        transform: Matrix4.identity()
          ..translateByVector3(Vector3(-12.0, -7, 0.0))
          ..scaleByVector3(Vector3(1.8, 1.8, 1.8)),
        child: SvgIconSimple.asset(
          AppIcons.levelBadge2,
          size: UserHeaderConstants.iconSize,
        ),
      ),
      count: diamondCount,
      backgroundColor: UserHeaderConstants.diamondBadgeColor,
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: UserHeaderConstants.badgePadding,
        vertical: UserHeaderConstants.badgeVerticalPadding,
      ),
      borderRadius: UserHeaderConstants.badgeBorderRadius,
      iconSize: UserHeaderConstants.iconSize,
      gap: 0,
      minWidth: UserHeaderConstants.minBadgeWidth,
    );
  }

  Widget _buildContributionText() {
    return Row(
      children: [
        Text(
          contribution,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        const Text("💎", style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildDistanceText(BuildContext context) {
    return Text(
      distance,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
    );
  }
}
