import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/home/widgets/layouts/avatar_button.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TitleWithUnderline(),
            AvatarButton(imagePath: 'lib/assets/images/demo1.jpg', borderRadius: 16),
          ],
        ),
      ),
    );
  }
}

class TitleWithUnderline extends StatelessWidget {
  const TitleWithUnderline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          'Quận',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
            height: 1.0,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(height: 2),
        Text(
          'Cầu Giấy',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
            height: 1.2,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
