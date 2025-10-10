import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/auth/widgets/terms_text.dart';
import 'package:flutter_boilerplate/features/auth/widgets/auth_button_section.dart';

class AuthActions extends StatelessWidget {
  final double horizontalPadding;
  final double buttonSpacing;

  final List<Map<String, dynamic>> buttons;

  const AuthActions({
    super.key,
    this.horizontalPadding = 32,
    this.buttonSpacing = 12,
    this.buttons = const [
      {'icon': Icons.apple, 'text': 'Tiếp tục bằng Apple', 'color': null, 'onPressed': null},
      {'icon': Icons.g_mobiledata, 'text': 'Tiếp tục bằng Google', 'color': Colors.red, 'onPressed': null},
      {'icon': Icons.facebook, 'text': 'Tiếp tục bằng Facebook', 'color': Colors.blue, 'onPressed': null},
    ],
  });

  @override
  Widget build(BuildContext context) {
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
