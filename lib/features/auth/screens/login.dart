import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/features/auth/widgets/login_header.dart';
import 'package:flutter_boilerplate/features/auth/widgets/auth_button_section.dart';
import 'package:flutter_boilerplate/features/auth/widgets/terms_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/bg-image.png',
            ),
            fit: BoxFit.cover,
            alignment: Alignment(-0.6, 0.9),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(child: LoginHeader()),
              AuthButtonsSection(),
              TermsText(),
            ],
          ),
        ),
      ),
    );
  }
}