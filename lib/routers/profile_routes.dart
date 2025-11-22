import 'package:go_router/go_router.dart';
import '../../features/profile/screens/edit_user.dart';
import '../../features/profile/screens/user_me_screen.dart';
import '../../features/profile/screens/my_album.dart';
import '../../features/profile/screens/album_viewer_screen.dart';
import '../../features/profile/screens/edit_nickname.dart';
import '../../features/profile/screens/edit_bio.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/profile_view_screen.dart';
import '../../features/profile/screens/user_relation_screen.dart';
import '../../features/profile/screens/gift_screen.dart';
import '../core/core.dart';
import 'package:flutter/material.dart';

final profileRoutes = <GoRoute>[
  GoRoute(
    path: RouteConstants.userMe,
    builder: (context, state) {
      final userId = state.uri.queryParameters['id'];
      return UserMeScreen(userId: userId);
    },
  ),
  GoRoute(
    path: RouteConstants.userSetting,
    builder: (context, state) => EditUser(),
  ),
  GoRoute(
    path: RouteConstants.myAlbum,
    builder: (context, state) => const MyAlbumScreen(),
  ),
  GoRoute(
    path: RouteConstants.albumViewer,
    pageBuilder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;
      return CustomTransitionPage(
        key: state.pageKey,
        child: AlbumViewerScreen(
          images: extra['images'] as List<String>,
          initialIndex: extra['index'] as int,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end)
              .chain(CurveTween(curve: Curves.easeInOut));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    },
  ),
  GoRoute(
    path: RouteConstants.userEditNickname,
    builder: (context, state) => const EditNicknameScreen(),
  ),
  GoRoute(
    path: RouteConstants.userEditBio,
    builder: (context, state) => const EditBioScreen(),
  ),
  GoRoute(
    path: RouteConstants.userProfile,
    builder: (context, state) => ProfileScreen(),
  ),
  GoRoute(
    path: RouteConstants.userRelationships,
    builder: (context, state) => UserRelationScreen(),
  ),
  GoRoute(
    path: RouteConstants.userProfileView,
    builder: (context, state) => ProfileViewScreen(),
  ),
  GoRoute(
    path: RouteConstants.userGifts,
    builder: (context, state) => GiftScreen(),
  ),
];
