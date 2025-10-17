import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/core.dart';
import 'package:jt291_flutter_mobile/features/auth/controllers/auth_controller.dart';
import 'package:jt291_flutter_mobile/assets/assets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onSignIn(
    ProviderLogin provider, {
    String? password,
    String? username,
  }) async {
    if (!_formKey.currentState!.validate()) return;

    final authController = ref.read(authControllerProvider.notifier);

    try {
      if (provider != ProviderLogin.password) {
        await authController.loginWithProvide(context, provider);
      } else {
        if (password != null && username != null) {
          // If login with password
        }
      }
    } catch (e) {
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage(ImagePaths.getPath(ImagePath.splash)),
                        fit: BoxFit.contain,
                        opacity: 1,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildHeader(context),
                        _buildForm(),
                        _buildFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Victoria Tour!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'Welcome to Travel ERP admin',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.gray[5],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 12,
        children: [
          // Username
          ElevatedButton(
            onPressed: () async {
              await _onSignIn(ProviderLogin.google);
            },
            child: Text("Login with Google"),
          ),
          if (AppConstants.osType == 'iOS')
            ElevatedButton(
              onPressed: () async {
                await _onSignIn(ProviderLogin.apple);
              },
              child: Text("Login with Apple"),
            ),
          ElevatedButton(
            onPressed: () => () async {
              await _onSignIn(ProviderLogin.facebook);
            },
            child: Text("Login with Facebook"),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'By selecting continue to the next step, you agree to our ',
            style: TextStyle(color: AppColors.gray[5], fontSize: 12),
            children: [
              TextSpan(
                text: 'Terms of Service',
                style: TextStyle(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Open Terms link
                  },
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(color: AppColors.gray[5]),
              ),
              TextSpan(
                text: 'Privacy Policy.',
                style: TextStyle(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Open Privacy link
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
