import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/monthly_card_model.dart';
import 'package:jt291_flutter_mobile/data/services/wallet_service.dart';
import 'package:jt291_flutter_mobile/core/base/base_async_notifier.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';

final monthlyCardProvider =
    AsyncNotifierProvider<MonthlyCardNotifier, List<MonthlyCardModel>>(
      MonthlyCardNotifier.new,
    );

class MonthlyCardNotifier extends BaseAsyncNotifier<List<MonthlyCardModel>> {
  final WalletService _service = WalletService();

  String _getUserId() {
    final user = ref.read(userGeneralProvider);
    final userId = user.value?.unionId;
    if (userId == null) throw Exception('User ID is null');
    return userId;
  }

  @override
  Future<List<MonthlyCardModel>> fetchData() async {
    final userId = _getUserId();
    return _service.getMonthlyCards(userId);
  }
}