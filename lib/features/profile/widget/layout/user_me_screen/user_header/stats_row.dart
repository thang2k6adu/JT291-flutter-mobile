import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/icon-number-badge.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_me_screen/user_header/user_header_constants.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

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
    return IconNumberBadge(
      icon: SvgIconSimple.string(
        UserHeaderConstants.crownSvg,
        size: UserHeaderConstants.iconSize,
        color: Colors.white,
      ),
      count: crownCount,
      backgroundColor: UserHeaderConstants.crownBadgeColor,
      iconBackgroundColor: UserHeaderConstants.crownIconColor,
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: UserHeaderConstants.badgePadding,
        vertical: UserHeaderConstants.badgeVerticalPadding,
      ),
      borderRadius: UserHeaderConstants.badgeBorderRadius,
      iconSize: UserHeaderConstants.iconSize,
      gap: UserHeaderConstants.iconGap,
      minWidth: UserHeaderConstants.minBadgeWidth,
    );
  }

  Widget _buildDiamondBadge() {
    return IconNumberBadge(
      icon: SvgIconSimple.string(
        UserHeaderConstants.diamondSvg,
        size: UserHeaderConstants.iconSize,
        color: Colors.white,
      ),
      count: diamondCount,
      backgroundColor: UserHeaderConstants.diamondBadgeColor,
      iconBackgroundColor: UserHeaderConstants.diamondIconColor,
      textColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: UserHeaderConstants.badgePadding,
        vertical: UserHeaderConstants.badgeVerticalPadding,
      ),
      borderRadius: UserHeaderConstants.badgeBorderRadius,
      iconSize: UserHeaderConstants.iconSize,
      gap: UserHeaderConstants.iconGap,
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
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
