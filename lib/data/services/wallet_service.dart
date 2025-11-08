import 'package:jt291_flutter_mobile/data/models/wallet/wallet_summary_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/recharge_package_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/monthly_card_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/wallet_mock.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class WalletService {
  final ApiService _apiService = ApiService();

  WalletService();

  // GET /users/{user_id}/wallet/summary
  Future<WalletSummaryModel> getWalletSummary(String userId) async {
    print('getWalletSummary: $userId');
    // Mock
    await Future.delayed(const Duration(milliseconds: 300));
    return walletSummaryMock;
    // TODO: Implement this
    // final response = await _apiService.get('/v1/users/$userId/wallet/summary');
    // return WalletSummaryModel.fromJson(response['data']);
  }

  // GET /users/{user_id}/recharge/packages
  Future<List<RechargePackageModel>> getRechargePackages(String userId) async {
    print('getRechargePackages: $userId');
    // Mock
    await Future.delayed(const Duration(milliseconds: 300));
    return rechargePackagesMock;
    // TODO: Implement this
    // final response = await _apiService.get('/v1/users/$userId/recharge/packages');
    // return List<RechargePackageModel>.from(response['data']);
  }

  // GET /users/{user_id}/recharge/monthly-cards
  Future<List<MonthlyCardModel>> getMonthlyCards(String userId) async {
    print('getMonthlyCards: $userId');
    // Mock
    await Future.delayed(const Duration(milliseconds: 300));
    return monthlyCardsMock;
    // TODO: Implement this
    // final response = await _apiService.get('/v1/users/$userId/recharge/monthly-cards');
    // return List<MonthlyCardModel>.from(response['data']);
  }

  // GET /users/{user_id}/wallet/transactions/history?page=1&limit=20
  Future<TransactionHistoryResponse> getTransactionHistory(
    String userId,
    int page,
    int limit,
  ) async {
    print('getTransactionHistory: $userId, $page, $limit');
    // Mock
    await Future.delayed(const Duration(milliseconds: 300));
    return mockTransactionHistoryResponse;
    // TODO: Implement this
    // final response = await _apiService.get('/v1/users/$userId/wallet/transactions/history', queryParameters: {'page': page, 'limit': limit});
    // return TransactionHistoryResponse.fromJson(response['data']);
  }
}

final walletServiceProvider = Provider<WalletService>((ref) {
  return WalletService();
});