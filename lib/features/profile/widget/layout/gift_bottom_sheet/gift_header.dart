import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';

class GiftHeader extends StatelessWidget {
  const GiftHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        AppImages.giftBottomSheetBg,
        fit: BoxFit.fitWidth,
        width: double.infinity,
      ),
    );
  }
}