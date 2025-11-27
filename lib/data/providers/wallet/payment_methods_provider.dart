import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_async_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/payment_method_model.dart';
import 'package:jt291_flutter_mobile/data/services/wallet_service.dart';

final paymentMethodsProvider =
    AsyncNotifierProvider<PaymentMethodsNotifier, List<PaymentMethodModel>>(
      PaymentMethodsNotifier.new,
    );

class PaymentMethodsNotifier extends BaseAsyncNotifier<List<PaymentMethodModel>> {
  final WalletService _service = WalletService();

  @override
  Future<List<PaymentMethodModel>> fetchData() async {
    return _service.getPaymentMethods();
  }
}

