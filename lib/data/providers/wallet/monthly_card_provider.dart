import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/monthly_card_model.dart';
import 'package:jt291_flutter_mobile/data/services/wallet_service.dart';
import 'package:jt291_flutter_mobile/core/base/base_async_notifier.dart';

final monthlyCardProvider =
    AsyncNotifierProvider<MonthlyCardNotifier, List<MonthlyCardModel>>(
      MonthlyCardNotifier.new,
    );

class MonthlyCardNotifier extends BaseAsyncNotifier<List<MonthlyCardModel>> {
  final WalletService _service = WalletService();

  @override
  Future<List<MonthlyCardModel>> fetchData() async {
    final response = await _service.getMonthlyCards();
    return response.data ?? [];
  }
}