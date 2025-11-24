import 'package:jt291_flutter_mobile/data/models/wallet/transaction_model.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
import 'package:jt291_flutter_mobile/data/services/wallet_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';

final transactionHistoryProvider =
    AsyncNotifierProvider<
      TransactionHistoryNotifier,
      List<TransactionModel>
    >(TransactionHistoryNotifier.new);

class TransactionHistoryNotifier
    extends BasePaginatedNotifier<TransactionModel> {
  late final WalletService _service;

  @override
  Future<List<TransactionModel>> build() async {
    _service = ref.read(walletServiceProvider);
    return super.build();
  }

  @override
  String getCacheKey(String? search) {
    return 'transaction_history${search != null && search.isNotEmpty ? "_$search" : ""}';
  }

  @override
  Future<PaginatedResponse<TransactionModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    final user = ref.watch(userGeneralProvider);
    final userId = user.value?.unionId;
    if (userId == null) {
      // AsyncNotifier sẽ throw => state = AsyncError
      throw Exception('User ID is null');
    }
    final response = await _service.getTransactionHistory(userId, page, limit);
    print('TransactionHistory fetchPage response: ${response.data?.items.length} items');
    return ApiPaginatedResponse(response);
  }
}
