import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'guard.dart';

class AuthGuard extends ConsumerWidget {
  final Widget child;
  final String fallbackRoute;

  const AuthGuard({
    super.key,
    required this.child,
    this.fallbackRoute = '/',
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return authState.when(
      data: (user) {
        final canActivate = user != null;
        return Guard(
          canActivate: canActivate,
          fallbackRoute: fallbackRoute,
          child: child,
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const Scaffold(
        body: Center(child: Text('Error loading auth')),
      ),
    );
  }
}

