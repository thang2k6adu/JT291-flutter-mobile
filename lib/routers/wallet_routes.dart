import 'package:go_router/go_router.dart';
import '../../features/wallet/screens/diamond_screen.dart';
import '../../features/wallet/screens/history_screen.dart';
import '../../features/wallet/screens/vex_wallet_screen.dart';
import '../../features/wallet/screens/deposit_screen.dart';
import '../core/core.dart';

final walletRoutes = <GoRoute>[
  GoRoute(
    path: RouteConstants.diamonds,
    builder: (context, state) => DiamondScreen(),
  ),
  GoRoute(
    path: RouteConstants.history,
    builder: (context, state) => HistoryScreen(),
  ),
  GoRoute(
    path: RouteConstants.vexWallet,
    builder: (context, state) => VexWalletScreen(),
  ),
  GoRoute(
    path: RouteConstants.deposit,
    builder: (context, state) => DepositScreen(),
  ),
];
