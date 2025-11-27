import 'package:jt291_flutter_mobile/data/models/wallet/wallet_summary_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/recharge_package_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/monthly_card_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/payment_method_model.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';

class WalletService {
  final ApiService _apiService = ApiService();

  WalletService();

  // GET /users/{user_id}/wallet/summary
  Future<WalletSummaryModel> getWalletSummary(String userId) async {
    print('getWalletSummary: $userId');
    // Mock
    // await Future.delayed(const Duration(milliseconds: 300));
    // return walletSummaryMock;
    // // TODO: Implement this
    final response = await _apiService.get('/wallet/summary');
    return WalletSummaryModel.fromJson(response['data']);
  }

  // GET /users/{user_id}/recharge/packages
  Future<ApiResponse<List<RechargePackageModel>>> getRechargePackages() async {
    print('getRechargePackages');
    // Mock
    // await Future.delayed(const Duration(milliseconds: 300));
    // return rechargePackagesMock;
    // TODO: Implement this
    final response = await _apiService.get('/wallet/recharge/packages');
    return ApiResponse.fromJson(
      response,
      (json) => (json as List<dynamic>)
          .map((e) => RechargePackageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // GET /users/{user_id}/recharge/monthly-cards
  Future<ApiResponse<List<MonthlyCardModel>>> getMonthlyCards() async {
    print('getMonthlyCards');
    // Mock
    // await Future.delayed(const Duration(milliseconds: 300));
    // return monthlyCardsMock;
    // TODO: Implement this
    final response = await _apiService.get('/wallet/recharge/monthly-cards');
    return ApiResponse.fromJson(
      response,
      (json) => (json as List<dynamic>)
          .map((e) => MonthlyCardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // GET /users/{user_id}/wallet/transactions/history?page=1&limit=20
  Future<ApiResponse<PaginatedData<TransactionModel>>> getTransactionHistory(
    String userId,
    int page,
    int limit,
  ) async {
    print('getTransactionHistory: $userId, $page, $limit');
    // Mock
    // await Future.delayed(const Duration(milliseconds: 300));
    // return mockTransactionHistoryResponse;
    // TODO: Implement this
    final response = await _apiService.get(
      '/wallet/transactions/history',
      queryParameters: {'page': page, 'limit': limit},
    );
    return ApiResponse.fromJson(
      response,
      (json) => PaginatedData.fromJson(
        json as Map<String, dynamic>,
        (item) => TransactionModel.fromJson(item as Map<String, dynamic>),
        dataKey: 'data', // API uses "data" instead of "items"
      ),
    );
  }

  // GET /wallet/payment-methods
  Future<List<PaymentMethodModel>> getPaymentMethods() async {
    print('getPaymentMethods');
    final response = await _apiService.get('/wallet/payment-methods');
    return (response['data'] as List<dynamic>)
        .map((e) => PaymentMethodModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // POST /wallet/recharge/checkout
  Future<Map<String, dynamic>> checkout({
    required int packageId,
    required String currency, // "diamond" or "vex"
  }) async {
    print('checkout: packageId=$packageId, currency=$currency');
    final response = await _apiService.post(
      '/wallet/recharge/checkout',
      data: {
        'packageId': packageId,
        'currency': currency,
      },
    );
    return response['data'] as Map<String, dynamic>;
  }

  // GET /wallet/transactions/{transactionId} - Verify transaction status
  Future<Map<String, dynamic>> verifyTransaction(String transactionId) async {
    print('verifyTransaction: $transactionId');
    final response = await _apiService.get('/wallet/transactions/$transactionId');
    return response['data'] as Map<String, dynamic>;
  }
}

final walletServiceProvider = Provider<WalletService>((ref) {
  return WalletService();
});
