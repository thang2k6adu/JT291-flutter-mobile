import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/auth/widgets/terms_text.dart';
import 'package:flutter_boilerplate/features/auth/widgets/auth_button_section.dart';

class AuthActions extends StatelessWidget {
  final double horizontalPadding;
  final double buttonSpacing;
  final List<Map<String, dynamic>> buttons;

  const AuthActions({
    super.key,
    required this.buttons,
    this.horizontalPadding = 32,
    this.buttonSpacing = 12,
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
