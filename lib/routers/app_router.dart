import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/providers/auth/auth_provider.dart';
import '../features/auth/screens/app_initializer.dart';
import 'auth_routes.dart';
import 'home_routes.dart';
import 'profile_routes.dart';
import 'wallet_routes.dart';
import 'search_routes.dart';
import '../data/models/users/user_model.dart';
import '../core/constants/route_constants.dart';
import 'social_router.dart';

class RouterRefreshNotifier extends ChangeNotifier {
  void refresh() => notifyListeners();
}

final routerRefreshNotifier = RouterRefreshNotifier();

final routerProvider = Provider<GoRouter>((ref) {
  ref.listen<AsyncValue<UserModel?>>(
    userAuthProvider,
    (previous, next) => routerRefreshNotifier.refresh(),
  );

  return GoRouter(
    initialLocation: RouteConstants.main,
    debugLogDiagnostics: true,
    refreshListenable: routerRefreshNotifier,
    routes: [
      ...authRoutes,
      ShellRoute(
        builder: (context, state, child) => AppInitializer(child: child),
        routes: [
          ...homeRoutes,
          ...profileRoutes,
          ...walletRoutes,
          ...searchRoutes,
          ...socialRoutes,
        ],
      ),
    ],
    redirect: (context, state) {
      // Handle deep link: jt291://payment/success?transactionId=...&token=...&PayerID=...
      final uri = state.uri;
      if (uri.scheme == 'jt291' && uri.host == 'payment') {
        if (uri.pathSegments.isNotEmpty) {
          final action = uri.pathSegments[0]; // 'success' hoặc 'cancel'
          final transactionId = uri.queryParameters['transactionId'];
          final token = uri.queryParameters['token'];
          final payerId = uri.queryParameters['PayerID'];

          if (action == 'success') {
            // Payment thành công - build query string with all parameters
            final queryParams = <String>['success=true'];
            if (transactionId != null && transactionId.isNotEmpty) {
              queryParams.add('transactionId=${Uri.encodeComponent(transactionId)}');
            }
            if (token != null && token.isNotEmpty) {
              queryParams.add('token=${Uri.encodeComponent(token)}');
            }
            if (payerId != null && payerId.isNotEmpty) {
              queryParams.add('payerId=${Uri.encodeComponent(payerId)}');
            }
            return '${RouteConstants.diamonds}?${queryParams.join('&')}';
          } else if (action == 'cancel') {
            // Payment bị cancel
            final queryParams = <String>['cancelled=true'];
            if (transactionId != null && transactionId.isNotEmpty) {
              queryParams.add('transactionId=${Uri.encodeComponent(transactionId)}');
            }
            return '${RouteConstants.diamonds}?${queryParams.join('&')}';
          } else if (action == 'failed' || action == 'error') {
            // Payment thất bại
            final queryParams = <String>['failed=true'];
            if (transactionId != null && transactionId.isNotEmpty) {
              queryParams.add('transactionId=${Uri.encodeComponent(transactionId)}');
            }
            return '${RouteConstants.diamonds}?${queryParams.join('&')}';
          }
        }
      }
      return null;
    },
  );
});
