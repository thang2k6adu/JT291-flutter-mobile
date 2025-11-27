  import 'package:flutter/material.dart';
  import 'package:jt291_flutter_mobile/data/models/wallet/recharge_package_model.dart';
  import 'package:jt291_flutter_mobile/features/wallet/widgets/ui/diamon_package_card.dart';
  import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

  class DiamondPackagesGrid extends StatelessWidget {
    final List<RechargePackageModel> packages;
    final String? currencyIcon;
  final Function(RechargePackageModel)? onPackageTap;

    final diamondIcons = [
      Image.asset(AppIcons.diamondPng, width: 24, height: 24),
      Image.asset(AppIcons.twoDiamondsPng, width: 30, height: 24),
      Image.asset(AppIcons.threeDiamondsPng, width: 36, height: 24),
      Image.asset(AppIcons.fourDiamondsPng, width: 36, height: 25.8),
      Image.asset(AppIcons.fiveDiamondsPng, width: 44, height: 24),
      Image.asset(AppIcons.bunchDiamondsPng, width: 48, height: 24),
    ];

  DiamondPackagesGrid({
    super.key,
    required this.packages,
    this.currencyIcon,
    this.onPackageTap,
  });

    @override
    Widget build(BuildContext context) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          final package = packages[index];
          return DiamondPackageCard(
            diamondsCount: package.diamonds.toString(),
            price: package.price.toString(),
            icon: diamondIcons[index],
            currencyIcon: currencyIcon,
            bonusDiamonds: null, // No bonus for diamond packages
            onTap: onPackageTap != null
                ? () => onPackageTap!(package)
                : null,
          );
        },
      );
    }
  }
