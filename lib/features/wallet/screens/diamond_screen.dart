import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/core/utils/number_utils.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/layout/diamond_screen/diamon_package_grid.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/layout/diamond_screen/balance_section.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/components/ui/vertical_section.dart';
import 'package:jt291_flutter_mobile/data/providers/wallet/wallet_summary_provider.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/layout/diamond_screen/monthly_card_section.dart';
import 'package:jt291_flutter_mobile/data/providers/wallet/recharge_packages_provider.dart';

class DiamondScreen extends ConsumerStatefulWidget {
  const DiamondScreen({super.key});

  @override
  ConsumerState<DiamondScreen> createState() => _DiamondScreenState();
}

class _DiamondScreenState extends ConsumerState<DiamondScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(walletSummaryProvider.notifier).refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final walletSummaryAsync = ref.watch(walletSummaryProvider);
    final rechargePackagesAsync = ref.watch(rechargePackagesProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBack(
        title: 'Diamond',
        bottomBorder: true,
        actions: [
          IconButton(
            onPressed: () {
              pushScreen(context, RouteConstants.history);
            },
            icon: SvgIconSimple.asset(AppIcons.receipt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Balance Card
            VerticalSection(
              spacing: 16,
              child: BalanceSection(
                totalBalance: formatNumberWithCommas(
                  walletSummaryAsync.value?.totalDiamondBalance ?? 0,
                ),
                features: [
                  {
                    'title': 'Vex conversion',
                    'subtitle': 'Account balance',
                    'onTap': () {
                      pushScreen(context, RouteConstants.vexWallet);
                    },
                  },
                  {
                    'title': 'Monthly card',
                    'subtitle': 'Aboxyz',
                    'onTap': () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return MonthlyCardSection();
                        },
                      );
                    },
                  },
                ],
              ),
            ),

            VerticalSection(
              spacing: 8,
              child: Text(
                'Recharge Diamond',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            rechargePackagesAsync.when(
              data: (packages) => DiamondPackagesGrid(packages: packages),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),
            ),
          ],
        ),
      ),
    );
  }
}
