import 'package:jt291_flutter_mobile/data/models/wallet/wallet_summary_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/recharge_package_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/wallet_mock.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';

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
}
