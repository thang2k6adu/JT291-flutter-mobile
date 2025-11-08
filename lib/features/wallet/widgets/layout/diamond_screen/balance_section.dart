
import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/ui/info_card.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/ui/feature_card.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';

class BalanceSection extends StatelessWidget {
  final String totalBalance;
  final List<Map<String, dynamic>> features;

  const BalanceSection({
    super.key,
    required this.totalBalance,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Total Balance InfoCard
        InfoCard(
          backgroundImage: AssetImage(AppImages.totalBalance),
          title: 'Total Balance',
          value: totalBalance,
          icon: AppIcons.diamondPng,
        ),

        const SizedBox(height: 16),

        // Feature Cards Row
        Row(
          children: [
            if (features.isNotEmpty)
              Expanded(
                child: FeatureCard(
                  title: features[0]['title'] ?? '',
                  subtitle: features[0]['subtitle'] ?? '',
                  onTap: features[0]['onTap'],
                  backgroundImage: AssetImage(AppImages.vexConversion),
                ),
              ),
            if (features.length > 1) const SizedBox(width: 12),
            if (features.length > 1)
              Expanded(
                child: FeatureCard(
                  title: features[1]['title'] ?? '',
                  subtitle: features[1]['subtitle'] ?? '',
                  onTap: features[1]['onTap'],
                  backgroundImage: AssetImage(AppImages.monthlyCard),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
