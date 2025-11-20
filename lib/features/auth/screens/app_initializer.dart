import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/core.dart';
import 'package:jt291_flutter_mobile/data/providers/auth/auth_provider.dart';
import 'package:jt291_flutter_mobile/features/auth/screens/splash_screen.dart';
import 'package:jt291_flutter_mobile/routers/app_router.dart';

class AppInitializer extends ConsumerStatefulWidget {
  final Widget child;
  const AppInitializer({super.key, required this.child});

  @override
  AppInitializerState createState() => AppInitializerState();
}

class AppInitializerState extends ConsumerState<AppInitializer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userAuth = ref.watch(userAuthProvider);
    final router = ref.read(routerProvider);

    return userAuth.when(
      loading: () {
        return SplashScreen();
      },
      data: (user) {
        print('AppInitializer user: $user');
        if (user != null) {
          return widget.child;
          // return StreamReadyScreen(child: widget.child);
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            router.go(RouteConstants.login);
          });
          return const SizedBox.shrink();
        }
      },
      error: (e, st) {
        print('AppInitializer error: $e');
        WidgetsBinding.instance.addPostFrameCallback((_) {
          router.go(RouteConstants.login);
        });
        return const SizedBox.shrink();
      },
    );
  }
}
