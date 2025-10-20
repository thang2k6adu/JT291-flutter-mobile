import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jt291_flutter_mobile/core/core.dart';
import 'package:jt291_flutter_mobile/data/providers/auth/firebase_provider.dart';
import 'package:jt291_flutter_mobile/features/auth/screens/app_initializer.dart';
import 'package:jt291_flutter_mobile/features/auth/screens/login_screen.dart';
import 'package:jt291_flutter_mobile/features/main/screens/main_screen.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/edit_user.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/user_me_screen.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  void refresh() => notifyListeners();
}

final routerRefreshNotifier = RouterRefreshNotifier();

final routerProvider = Provider<GoRouter>((ref) {
  ref.listen<AsyncValue<User?>>(
    firebaseAuthProvider,
    (previous, next) => routerRefreshNotifier.refresh(),
  );

  return GoRouter(
    initialLocation: RouteConstants.main,
    debugLogDiagnostics: true,
    refreshListenable: routerRefreshNotifier,
    routes: <RouteBase>[
      GoRoute(
        path: RouteConstants.login,
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return AppInitializer(child: child);
        },
        routes: [
          GoRoute(
            path: RouteConstants.main,
            builder: ((context, state) => const MainScreen()),
          ),
          GoRoute(
            path: RouteConstants.userMe,
            builder: ((context, state) => const UserMeScreen()),
          ),
          GoRoute(
            path: RouteConstants.userSetting,
            builder: ((context, state) => EditUser()),
          ),
        ],
      ),
    ],
  );
});
