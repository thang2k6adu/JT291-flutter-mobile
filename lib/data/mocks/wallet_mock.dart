import 'package:jt291_flutter_mobile/data/models/wallet/wallet_summary_model.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/recharge_package_model.dart';

final walletSummaryMock = WalletSummaryModel(
  totalDiamondBalance: 54292.79,
  vexBalance: 5000,
  monthlyCardStatus: "active",
);

final rechargePackagesMock = [
  RechargePackageModel(
    packageId: 1,
    diamonds: 435,
    price: 20,
  ),
  RechargePackageModel(
    packageId: 2,
    diamonds: 1230,
    price: 50,
  ),
  RechargePackageModel(
    packageId: 3,
    diamonds: 3210,
    price: 80,
  ),
  RechargePackageModel(
    packageId: 4,
    diamonds: 15380,
    price: 120,
  ),
  RechargePackageModel(
    packageId: 5,
    diamonds: 36920,
    price: 200,
  ),
  RechargePackageModel(
    packageId: 6,
    diamonds: 112300,
    price: 420,
  ),
];
