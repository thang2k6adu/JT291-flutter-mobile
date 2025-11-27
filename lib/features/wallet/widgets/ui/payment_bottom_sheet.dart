import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/payment_method_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/recharge_package_model.dart';
import 'package:jt291_flutter_mobile/data/providers/wallet/payment_methods_provider.dart';
import 'package:jt291_flutter_mobile/data/services/wallet_service.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentBottomSheet extends ConsumerStatefulWidget {
  final RechargePackageModel package;

  const PaymentBottomSheet({super.key, required this.package});

  @override
  ConsumerState<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends ConsumerState<PaymentBottomSheet> {
  PaymentMethodModel? _selectedPaymentMethod;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final paymentMethodsAsync = ref.watch(paymentMethodsProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Color(0xFFF2F2F7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header with Apple Pay style
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFE5E5E5), width: 0.5),
              ),
            ),
            child: Row(
              children: [
                // Apple logo (using Material icon as placeholder)
                const Icon(Icons.apple, size: 22),
                const SizedBox(width: 8),
                const Text(
                  'Pay',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, size: 24),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          Expanded(
            child: paymentMethodsAsync.when(
              data: (methods) => _buildContent(methods),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) =>
                  Center(child: Text('Error: ${error.toString()}')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(List<PaymentMethodModel> methods) {
    // Filter active methods and prioritize Visa (mock PayPal)
    final activeMethods = methods.where((m) => m.isActive).toList();
    PaymentMethodModel? visaMethod;
    try {
      visaMethod = activeMethods.firstWhere(
        (m) => m.id == 'visa' || m.type == 'card',
      );
    } catch (e) {
      // No visa method found, use first active method if available
      if (activeMethods.isNotEmpty) {
        visaMethod = activeMethods.first;
      }
    }

    // Set default selected method to Visa
    if (_selectedPaymentMethod == null && visaMethod != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _selectedPaymentMethod = visaMethod;
          });
        }
      });
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Payment Method Selection Card
          _buildPaymentMethodCard(visaMethod),

          const SizedBox(height: 16),

          // Subscription Details Card
          _buildSubscriptionCard(),

          const SizedBox(height: 24),

          // Action Button
          _buildActionButton(activeMethods),
        ],
      ),
    );
  }

  Widget _buildPaymentMethodCard(PaymentMethodModel? method) {
    if (method == null) return const SizedBox();

    return GestureDetector(
      onTap: () {
        // Only allow selection if it's Visa (mock PayPal)
        if (method.id == 'visa' || method.type == 'card') {
          setState(() {
            _selectedPaymentMethod = method;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Payment method not supported yet')),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Card icon (Visa blue)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1F71), // Visa blue
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.credit_card,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    method.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (method.maskedInfo != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      method.maskedInfo!,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Purple icon (Dolfie logo placeholder)
              Image.asset(AppIcons.appLogoPng, width: 54, height: 54),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dolfie',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'Premium avocado mash app',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const Text(
                      'Subscription',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(color: Colors.grey[200], thickness: 1),
          Text(
            '\$${widget.package.price}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.start,
          ),
          Divider(color: Colors.grey[200], thickness: 1),
          _buildTermsAndConditions(),
          Divider(color: Colors.grey[200], thickness: 1),
          _buildAccountInfo(),
        ],
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return const Text(
      'Cancel at any time in Settings > Apple Account at least a day before each renewal date. Plan automatically renews until cancelled.',
      style: TextStyle(fontSize: 12, color: Colors.black, height: 1.4),
      textAlign: TextAlign.start,
    );
  }

  Widget _buildAccountInfo() {
    return const Text(
      'Account: use@icloud.com',
      style: TextStyle(fontSize: 14, color: Colors.grey),
      textAlign: TextAlign.start,
    );
  }

  Widget _buildActionButton(List<PaymentMethodModel> methods) {
    final isVisaSelected =
        _selectedPaymentMethod?.id == 'visa' ||
        _selectedPaymentMethod?.type == 'card';

    return Column(
      children: [
        // Double-click instruction icon
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (_isProcessing || !isVisaSelected)
                ? null
                : () => _handleCheckout(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: _isProcessing
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text(
                    'Subscribe',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> _handleCheckout() async {
    if (_selectedPaymentMethod == null) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      final service = WalletService();
      final result = await service.checkout(
        packageId: widget.package.packageId,
        currency: 'diamond',
      );

      final paymentUrl = result['paymentUrl'] as String?;
      print('Payment URL received: $paymentUrl');

      if (paymentUrl != null && paymentUrl.isNotEmpty) {
        // Open payment URL in browser first, then close bottom sheet
        final uri = Uri.parse(paymentUrl);
        print('Parsed URI: $uri');

        try {
          // Note: canLaunchUrl sometimes returns false for valid URLs,
          // so we'll try to launch directly without checking first
          print('Attempting to launch URL directly...');
          var launched = false;

          // Try external application first (opens in external browser)
          try {
            print('Trying externalApplication mode...');
            launched = await launchUrl(
              uri,
              mode: LaunchMode.externalApplication,
            );
            print('Launch result (externalApplication): $launched');
          } catch (e) {
            print('Error with externalApplication: $e');
          }

          // If failed, try platformDefault
          if (!launched) {
            try {
              print('Trying platformDefault mode...');
              launched = await launchUrl(uri, mode: LaunchMode.platformDefault);
              print('Launch result (platformDefault): $launched');
            } catch (e) {
              print('Error with platformDefault: $e');
            }
          }

          // If still failed, try inAppWebView
          if (!launched) {
            try {
              print('Trying inAppWebView mode...');
              launched = await launchUrl(uri, mode: LaunchMode.inAppWebView);
              print('Launch result (inAppWebView): $launched');
            } catch (e) {
              print('Error with inAppWebView: $e');
            }
          }

          // Close bottom sheet regardless of launch result
          if (mounted) {
            Navigator.pop(context);
          }

          if (!launched) {
            print('All launch modes failed');
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Không thể mở trình duyệt. Vui lòng thử lại.'),
                  backgroundColor: Colors.orange,
                  duration: Duration(seconds: 3),
                ),
              );
            }
          } else {
            print('URL launched successfully');
          }
        } catch (e, stackTrace) {
          print('Error launching URL: $e');
          print('Stack trace: $stackTrace');
          // Close bottom sheet even on error
          if (mounted) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Lỗi khi mở URL: ${e.toString()}'),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          }
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Payment URL not available')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Checkout failed: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }
}
