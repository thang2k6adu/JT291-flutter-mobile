import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/auth/widgets/social_login_button.dart';

class AuthButtonsSection extends StatelessWidget {
  final List<Map<String, dynamic>> buttons;
  final double buttonSpacing;

  const AuthButtonsSection({
    super.key,
    required this.buttons,
    this.buttonSpacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buttons
          .map(
            (b) => Padding(
              padding: EdgeInsets.only(bottom: buttonSpacing),
              child: SocialLoginButton(
                icon: b['icon'] as IconData,
                text: b['text'] as String,
                iconColor: b['color'] as Color?,
                onPressed: b['onPressed'] as void Function()? ?? () {},
              ),
            ),
          )
          .toList(),
    );
  }
}
