import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_async_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/wallet/vex_package_model.dart';
import 'package:jt291_flutter_mobile/data/services/wallet_service.dart';

final vexPackagesProvider =
    AsyncNotifierProvider<VexPackagesNotifier, List<VexPackageModel>>(
      VexPackagesNotifier.new,
    );

class VexPackagesNotifier extends BaseAsyncNotifier<List<VexPackageModel>> {
  final WalletService _service = WalletService();

  @override
  Future<List<VexPackageModel>> fetchData() async {
    return _service.getVexPackages();
  }
}

