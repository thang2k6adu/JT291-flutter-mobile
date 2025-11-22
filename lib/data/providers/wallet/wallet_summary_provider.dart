import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_async_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/wallet_summary_model.dart';
import 'package:jt291_flutter_mobile/data/services/wallet_service.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';

final walletSummaryProvider =
    AsyncNotifierProvider<WalletSummaryNotifier, WalletSummaryModel>(
      WalletSummaryNotifier.new,
    );

class WalletSummaryNotifier extends BaseAsyncNotifier<WalletSummaryModel> {
  final WalletService _service = WalletService();

  @override
  Future<WalletSummaryModel> fetchData() async {
    final user = ref.watch(userGeneralProvider);
    final userId = user.value?.unionId;
    if (userId == null) {
      // AsyncNotifier sẽ throw => state = AsyncError
      throw Exception('User ID is null');
    }
    return _service.getWalletSummary(userId);
  }

  decrementDiamondBalance(int amount) {
    final current = state.value;
    if (current != null) {
      state = AsyncData(
        current.copyWith(
          totalDiamondBalance: current.totalDiamondBalance - amount,
        ),
      );
    }
  }

  incrementDiamondBalance(int amount) {
    final current = state.value;
    if (current != null) {
      state = AsyncData(
        current.copyWith(
          totalDiamondBalance: current.totalDiamondBalance + amount,
        ),
      );
    }
  }
}
