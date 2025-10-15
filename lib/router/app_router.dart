import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/features/auth/screens/login.dart';
import 'package:flutter_boilerplate/features/profile/screens/user_profile.dart';
import 'package:flutter_boilerplate/core/extensions/auth_guard.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/user-profile',
      name: 'userProfile',
      builder: (context, state) => const AuthGuard(
        child: ProfileScreen(),
      ),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('404 - Page not found: ${state.error}'),
    ),
  ),
);
