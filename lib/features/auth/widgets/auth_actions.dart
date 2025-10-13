// lib/features/auth/widgets/auth_actions.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_boilerplate/features/auth/widgets/terms_text.dart';
import 'package:flutter_boilerplate/features/auth/widgets/auth_button_section.dart';
import 'package:flutter_boilerplate/features/auth/controllers/auth_controller.dart';

class AuthActions extends ConsumerWidget {
  final double horizontalPadding;
  final double buttonSpacing;

  const AuthActions({
    super.key,
    this.horizontalPadding = 32,
    this.buttonSpacing = 12,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    // Nếu đang loading thì show indicator
    if (authState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Nếu có lỗi
    if (authState.hasError) {
      return Center(
        child: Text(
          authState.error.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    // Danh sách các nút
    final buttons = [
      {
        'icon': Icons.apple,
        'text': 'Tiếp tục bằng Apple',
        'color': Colors.black,
        'onPressed': () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Fake Apple login')));
        },
      },
      {
        'icon': Icons.g_mobiledata,
        'text': 'Tiếp tục bằng Google',
        'color': Colors.red,
        'onPressed': () async {
          await ref
              .read(authControllerProvider.notifier)
              .signIn('test@gmail.com', '123456');
        },
      },
      {
        'icon': Icons.facebook,
        'text': 'Tiếp tục bằng Facebook',
        'color': Colors.blue,
        'onPressed': () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Fake Facebook login')));
        },
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthButtonsSection(buttons: buttons, buttonSpacing: buttonSpacing),
          const SizedBox(height: 16),
          const TermsText(),
        ],
      ),
    );
  }
}
