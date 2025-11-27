import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
import 'package:jt291_flutter_mobile/features/wallet/widgets/ui/payment_bottom_sheet.dart';
import 'package:jt291_flutter_mobile/data/services/wallet_service.dart';

class DiamondScreen extends ConsumerStatefulWidget {
  const DiamondScreen({super.key});

  @override
  ConsumerState<DiamondScreen> createState() => _DiamondScreenState();
}

class _DiamondScreenState extends ConsumerState<DiamondScreen> with WidgetsBindingObserver {
  bool _hasCheckedPayment = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.microtask(() {
      ref.read(walletSummaryProvider.notifier).refresh();
    });
    
    // Check for payment success from deep link
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkPaymentSuccess();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // When app comes back from background (after payment), check for success
    if (state == AppLifecycleState.resumed && !_hasCheckedPayment) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkPaymentSuccess();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check for payment success from deep link when dependencies change
    // This ensures we catch deep link redirects even if screen was already initialized
    if (!_hasCheckedPayment) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkPaymentSuccess();
      });
    }
  }

  Future<void> _checkPaymentSuccess() async {
    if (_hasCheckedPayment) return;
    
    final router = GoRouter.of(context);
    final location = router.routerDelegate.currentConfiguration.uri.toString();
    final uri = Uri.parse(location);
    
    // Check if we came from deep link with success parameter
    if (uri.queryParameters.containsKey('success') && uri.queryParameters['success'] == 'true') {
      _hasCheckedPayment = true;
      
      // Extract all parameters from URL
      final transactionId = uri.queryParameters['transactionId'];
      final token = uri.queryParameters['token'];
      final payerId = uri.queryParameters['payerId'];
      
      print('Payment success callback: transactionId=$transactionId, token=$token, payerId=$payerId');
      
      // Get current balance before refresh
      final currentBalance = ref.read(walletSummaryProvider).value?.totalDiamondBalance ?? 0;
      print('Current diamond balance before refresh: $currentBalance');
      
      // Wait a bit for backend to process the payment
      await Future.delayed(const Duration(milliseconds: 1000));
      
      // Refresh wallet summary to update diamond balance
      print('Refreshing wallet summary...');
      await ref.read(walletSummaryProvider.notifier).refresh();
      
      // Get new balance after refresh
      final newBalance = ref.read(walletSummaryProvider).value?.totalDiamondBalance ?? 0;
      print('New diamond balance after refresh: $newBalance');
      
      // Double check - refresh again after a short delay to ensure we get the latest balance
      await Future.delayed(const Duration(milliseconds: 500));
      await ref.read(walletSummaryProvider.notifier).refresh();
      final finalBalance = ref.read(walletSummaryProvider).value?.totalDiamondBalance ?? 0;
      print('Final diamond balance after second refresh: $finalBalance');
      
      // Show success message after refresh
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Thanh toán thành công'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
      }
      
      // Optionally verify transaction if transactionId exists (but don't fail if it doesn't)
      if (transactionId != null && transactionId.isNotEmpty) {
        try {
          final service = WalletService();
          final transaction = await service.verifyTransaction(transactionId);
          print('Transaction verified: $transaction');
          
          // Check transaction status (optional, just for logging)
          final status = transaction['status'] as String?;
          print('Transaction status: $status');
        } catch (e) {
          // Silently handle verification errors (404, etc.) - balance refresh is the real indicator
          print('Transaction verification failed (non-critical): $e');
          // Don't show error to user, balance refresh will confirm success
        }
      }
      
      // Remove query parameters from URL after a short delay to ensure UI updates
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        final cleanPath = location.split('?').first;
        router.go(cleanPath);
      }
    } 
    // Check if payment was cancelled
    else if (uri.queryParameters.containsKey('cancelled') && uri.queryParameters['cancelled'] == 'true') {
      _hasCheckedPayment = true;
      
      final transactionId = uri.queryParameters['transactionId'];
      print('Payment cancelled: transactionId=$transactionId');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Thanh toán đã bị hủy'),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 3),
          ),
        );
      }
      
      // Remove query parameters from URL
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        final cleanPath = location.split('?').first;
        router.go(cleanPath);
      }
    }
    // Check if payment failed
    else if (uri.queryParameters.containsKey('failed') && uri.queryParameters['failed'] == 'true') {
      _hasCheckedPayment = true;
      
      final transactionId = uri.queryParameters['transactionId'];
      print('Payment failed: transactionId=$transactionId');
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Thanh toán thất bại'),
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
      
      // Remove query parameters from URL
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        final cleanPath = location.split('?').first;
        router.go(cleanPath);
      }
    }
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
              data: (packages) => DiamondPackagesGrid(
                packages: packages,
                onPackageTap: (package) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => PaymentBottomSheet(package: package),
                  );
                },
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
}
