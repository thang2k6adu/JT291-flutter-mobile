import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Guard extends StatelessWidget {
  final bool canActivate;
  final Widget child;
  final String fallbackRoute;

  const Guard({
    super.key,
    required this.canActivate,
    required this.child,
    required this.fallbackRoute,
  });

  @override
  Widget build(BuildContext context) {
    if (canActivate) return child;

    // Redirect sau build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.pushReplacement(fallbackRoute);
    });

    // Có thể hiển thị loading tạm thời
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
