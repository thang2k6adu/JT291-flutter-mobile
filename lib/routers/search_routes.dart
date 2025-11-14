import 'package:go_router/go_router.dart';
import '../../features/profile/screens/search_user_screen.dart';
import '../core/core.dart';

final searchRoutes = <GoRoute>[
  GoRoute(
    path: RouteConstants.searchUser,
    builder: (context, state) => SearchUserScreen(),
  ),
];
