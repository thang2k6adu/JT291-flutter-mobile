import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/auth/widgets/social_login_button.dart';

class AuthButtonsSection extends StatelessWidget {
  const AuthButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final buttons = [
      {'icon': Icons.apple, 'text': 'Tiếp tục bằng Apple', 'color': null},
      {
        'icon': Icons.g_mobiledata,
        'text': 'Tiếp tục bằng Google',
        'color': Colors.red,
      },
      {
        'icon': Icons.facebook,
        'text': 'Tiếp tục bằng Facebook',
        'color': Colors.blue,
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: buttons
            .map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SocialLoginButton(
                  icon: b['icon'] as IconData,
                  text: b['text'] as String,
                  iconColor: b['color'] as Color?,
                  onPressed: () {},
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
