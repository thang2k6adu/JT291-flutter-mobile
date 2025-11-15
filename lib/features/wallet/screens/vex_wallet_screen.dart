import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/components/ui/vertical_section.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/layout/diamond_screen/diamon_package_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/wallet/recharge_packages_provider.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';

class VexWalletScreen extends ConsumerWidget {
  const VexWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rechargePackagesAsync = ref.watch(rechargePackagesProvider);

    return Scaffold(
      appBar: AppBarWithBack(title: 'Vex Wallet'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildBalanceCard(context),
            SizedBox(height: 16),
            VerticalSection(
              spacing: 8,
              child: Text(
                'Vex coin converted into diamonds will earn additional bonus diamonds.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4B5563),
                ),
              ),
            ),
            rechargePackagesAsync.when(
              data: (packages) => DiamondPackagesGrid(
                packages: packages,
                currencyIcon: AppIcons.vexPng,
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.vexPng),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Balance (VEX)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // VEX Icon
                    Image.asset(AppIcons.vexPng, width: 24, height: 24),
                    SizedBox(width: 12),
                    Text(
                      '54,292.79',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        '\$900USD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildActionButton(
                      icon: AppIcons.moneyReceivePng,
                      label: 'Deposit',
                      onTap: () {
                        pushScreen(context, RouteConstants.deposit);
                      },
                    ),
                    _buildActionButton(
                      icon: AppIcons.moneySendPng,
                      label: 'Withdraw',
                    ),
                    _buildActionButton(
                      icon: AppIcons.cardSendPng,
                      label: 'Transfer',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Color(0xFF3A3A4A),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                icon,
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
