import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/components/ui/vertical_section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/wallet/vex_packages_provider.dart';
import 'package:jt291_flutter_mobile/data/providers/wallet/wallet_summary_provider.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/vex_package_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/wallet_summary_model.dart';
import 'package:jt291_flutter_mobile/data/services/wallet_service.dart';
import 'package:jt291_flutter_mobile/core/utils/number_utils.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/ui/diamon_package_card.dart';

class VexWalletScreen extends ConsumerStatefulWidget {
  const VexWalletScreen({super.key});

  @override
  ConsumerState<VexWalletScreen> createState() => _VexWalletScreenState();
}

class _VexWalletScreenState extends ConsumerState<VexWalletScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(walletSummaryProvider.notifier).refresh();
      ref.read(vexPackagesProvider.notifier).refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    final walletSummaryAsync = ref.watch(walletSummaryProvider);
    final vexPackagesAsync = ref.watch(vexPackagesProvider);

    return Scaffold(
      appBar: AppBarWithBack(title: 'Vex Wallet'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildBalanceCard(context, walletSummaryAsync),
            const SizedBox(height: 16),
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
            vexPackagesAsync.when(
              data: (packages) => _buildVexPackagesGrid(packages),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text(error.toString())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVexPackagesGrid(List<VexPackageModel> packages) {
    final diamondIcons = [
      Image.asset(AppIcons.diamondPng, width: 24, height: 24),
      Image.asset(AppIcons.twoDiamondsPng, width: 30, height: 24),
      Image.asset(AppIcons.threeDiamondsPng, width: 36, height: 24),
      Image.asset(AppIcons.fourDiamondsPng, width: 36, height: 25.8),
      Image.asset(AppIcons.fiveDiamondsPng, width: 44, height: 24),
      Image.asset(AppIcons.bunchDiamondsPng, width: 48, height: 24),
    ];

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
          diamondsCount: package.totalDiamonds.toString(),
          price: package.vexAmount.toString(),
          icon: diamondIcons[index % diamondIcons.length],
          currencyIcon: AppIcons.vexPng,
          bonusDiamonds: package.bonusDiamonds, // Show bonus for VEX packages
          onTap: () => _handleVexCheckout(package),
        );
      },
    );
  }

  bool _isInsufficientFundsError(String errorMessage) {
    final lowerMessage = errorMessage.toLowerCase();
    return lowerMessage.contains('không đủ') ||
        lowerMessage.contains('insufficient') ||
        lowerMessage.contains('thiếu') ||
        lowerMessage.contains('số dư') ||
        lowerMessage.contains('balance') ||
        lowerMessage.contains('cần:') ||
        lowerMessage.contains('hiện có:');
  }

  Future<void> _handleVexCheckout(VexPackageModel package) async {
    try {
      final service = WalletService();
      final result = await service.checkoutVex(vexAmount: package.vexAmount);
      
      print('VEX checkout result: $result');
      
      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Đổi thành công! Nhận được ${result['totalDiamondsReceived']} diamonds (${result['bonusDiamonds']} bonus)',
            ),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      }
      
      // Refresh wallet summary to update balances
      ref.read(walletSummaryProvider.notifier).refresh();
    } catch (e) {
      print('VEX checkout error: $e');
      if (mounted) {
        // Extract error message
        String errorMessage = e.toString();
        if (errorMessage.startsWith('Exception: ')) {
          errorMessage = errorMessage.substring('Exception: '.length);
        }
        
        // Check if it's an insufficient funds error
        final displayMessage = _isInsufficientFundsError(errorMessage)
            ? 'Thanh toán thất bại'
            : errorMessage;
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(displayMessage),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Đóng',
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    }
  }

  Widget _buildBalanceCard(BuildContext context, AsyncValue<WalletSummaryModel> walletSummaryAsync) {
    // Always show the card, use data or default values
    final vexBalance = walletSummaryAsync.value?.vexBalance ?? 0;
    final isLoading = walletSummaryAsync.isLoading;
    
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
                    if (isLoading)
                      SizedBox(
                        width: 100,
                        height: 28,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      )
                    else
                    Text(
                        formatNumberWithCommas(vexBalance),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(width: 8),
                    if (!isLoading)
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                          '\$${(vexBalance * 0.01657).toStringAsFixed(0)}USD', // Approximate USD value
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
