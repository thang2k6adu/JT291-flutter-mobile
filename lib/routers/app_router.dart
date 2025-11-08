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
import 'package:jt291_flutter_mobile/features/profile/screens/my_album.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/profile_screen.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/profile_view_screen.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/user_me_screen.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/edit_nickname.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/edit_bio.dart';
import 'package:jt291_flutter_mobile/features/home/screens/home_screen.dart';
import 'package:jt291_flutter_mobile/features/profile/screens/user_relation_screen.dart';
import 'package:jt291_flutter_mobile/features/wallet/screens/diamond_screen.dart';
import 'package:jt291_flutter_mobile/features/wallet/screens/history_screen.dart';

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
    initialLocation: RouteConstants.home,
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
            path: RouteConstants.home,
            builder: ((context, state) => const HomeScreen()),
          ),
          GoRoute(
            path: RouteConstants.userMe,
            builder: ((context, state) => UserMeScreen()),
          ),
          GoRoute(
            path: RouteConstants.userSetting,
            builder: ((context, state) => EditUser()),
          ),
          GoRoute(
            path: RouteConstants.myAlbum,
            builder: ((context, state) => const MyAlbumScreen()),
          ),
          GoRoute(
            path: RouteConstants.userEditNickname,
            builder: ((context, state) => const EditNicknameScreen()),
          ),
          GoRoute(
            path: RouteConstants.userEditBio,
            builder: ((context, state) => const EditBioScreen()),
          ),
          GoRoute(
            path: RouteConstants.userProfile,
            builder: ((context, state) => ProfileScreen()),
          ),
          GoRoute(
            path: RouteConstants.userRelationships,
            builder: ((context, state) => UserRelationScreen()),
          ),
          GoRoute(
            path: RouteConstants.userProfileView,
            builder: ((context, state) => ProfileViewScreen()),
          ),
          GoRoute(
            path: RouteConstants.diamonds,
            builder: ((context, state) => DiamondScreen()),
          ),
          GoRoute(
            path: RouteConstants.history,
            builder: ((context, state) => HistoryScreen()),
          ),
        ],
      ),
    ],
  );
});
