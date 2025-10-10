import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_boilerplate/features/auth/screens/login.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
  // Optional: nếu có lỗi route
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('404 - Page not found: ${state.error}'),
    ),
  ),
);
