import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/core/utils/number_utils.dart';
import 'package:jt291_flutter_mobile/data/mocks/wallet_mock.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/layout/diamond_screen/diamon_package_grid.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/layout/diamond_screen/balance_section.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/components/ui/vertical_section.dart';
import 'package:jt291_flutter_mobile/data/providers/wallet/wallet_summary_provider.dart';

class DiamondScreen extends ConsumerWidget {
  const DiamondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletSummaryAsync = ref.watch(walletSummaryProvider);

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
                    'onTap': () {},
                  },
                  {
                    'title': 'Monthly card',
                    'subtitle': 'Aboxyz',
                    'onTap': () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => MonthlyCardBottomSheet(),
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
            DiamondPackagesGrid(packages: rechargePackagesMock),
          ],
        ),
      ),
    );
  }
}

class MonthlyCardBottomSheet extends StatefulWidget {
  const MonthlyCardBottomSheet({super.key});

  @override
  State<MonthlyCardBottomSheet> createState() => _MonthlyCardBottomSheetState();
}

class _MonthlyCardBottomSheetState extends State<MonthlyCardBottomSheet> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Wrap với Container để tạo background và bo tròn góc trên
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Chiếm vừa nội dung
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: SizedBox(
              width: 40,
              child: Divider(
                thickness: 4,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Monthly card',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => setState(() => selectedIndex = 0),
            child: _buildCardOption(
              isSelected: selectedIndex == 0,
              diamonds: '465',
              dailyReward: '15',
              backgroundColor: const Color(0xFFFFE5F0),
              borderColor: const Color(0xFFFF90C2),
            ),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => setState(() => selectedIndex = 1),
            child: _buildCardOption(
              isSelected: selectedIndex == 1,
              diamonds: '987',
              dailyReward: '25',
              backgroundColor: const Color(0xFFF5F5F5),
              borderColor: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                print('Purchase button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE75B8D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                elevation: 0,
              ),
              child: const Text(
                '5.79 USD/per month',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCardOption({
    required bool isSelected,
    required String diamonds,
    required String dailyReward,
    required Color backgroundColor,
    required Color borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? borderColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('💎', style: TextStyle(fontSize: 24)),
                    const SizedBox(width: 8),
                    Text(
                      diamonds,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Receive $dailyReward diamonds daily',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const Text('🪙', style: TextStyle(fontSize: 50)),
        ],
      ),
    );
  }
}
