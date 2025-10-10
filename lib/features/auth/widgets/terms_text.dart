import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontSize: 11, color: Colors.grey[400]),
          children: const [
            TextSpan(text: 'Qua đăng nhập Dolfie, bạn đã đồng ý với '),
            TextSpan(text: '"Điều khoản dịch vụ Dolfie"', style: TextStyle(color: Color(0xFFEC4899))),
            TextSpan(text: ' & '),
            TextSpan(text: '"Chính sách Riêng tư Dolfie"', style: TextStyle(color: Color(0xFFEC4899))),
          ],
        ),
      ),
    );
  }
}