import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/features/auth/screens/login.dart';
import 'package:flutter_boilerplate/features/profile/screens/user_profile.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/user-profile',
      name: 'userProfile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
  // Optional: nếu có lỗi route
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('404 - Page not found: ${state.error}'),
    ),
  ),
);
