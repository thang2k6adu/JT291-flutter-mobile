import 'package:flutter/material.dart';

void main() {
  runApp(const DoflieApp());
}

class DoflieApp extends StatelessWidget {
  const DoflieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doflie',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?w=800&q=80',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Status bar spacer
              const SizedBox(height: 20),

              // Logo and branding section
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          '6',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // App name
                    const Text(
                      'DOFLIE',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 4,
                      ),
                    ),
                  ],
                ),
              ),

              // Authentication buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    // Apple sign in
                    _SocialLoginButton(
                      icon: Icons.apple,
                      text: 'Tiếp tục bằng Apple',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 12),

                    // Google sign in
                    _SocialLoginButton(
                      icon: Icons.g_mobiledata,
                      text: 'Tiếp tục bằng Google',
                      onPressed: () {},
                      iconColor: Colors.red,
                    ),
                    const SizedBox(height: 12),

                    // Facebook sign in
                    _SocialLoginButton(
                      icon: Icons.facebook,
                      text: 'Tiếp tục bằng Facebook',
                      onPressed: () {},
                      iconColor: Colors.blue,
                    ),
                    const SizedBox(height: 20),

                    // Terms text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[400],
                          ),
                          children: const [
                            TextSpan(
                              text: 'Qua đăng nhập Dolfie, bạn đã đồng ý với ',
                            ),
                            TextSpan(
                              text: '"Điều khoản dịch vụ Dolfie"',
                              style: TextStyle(color: Color(0xFFEC4899)),
                            ),
                            TextSpan(text: ' & '),
                            TextSpan(
                              text: '"Chính sách Riêng tư Dolfie"',
                              style: TextStyle(color: Color(0xFFEC4899)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final Color? iconColor;

  const _SocialLoginButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor ?? Colors.black, size: 24),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
