import 'package:go_router/go_router.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/main/screens/main_screen.dart';
import '../core/core.dart';

final homeRoutes = <GoRoute>[
  GoRoute(
    path: RouteConstants.main,
    builder: (context, state) => const MainScreen(),
  ),
  GoRoute(
    path: RouteConstants.home,
    builder: (context, state) => const HomeScreen(),
  ),
];
