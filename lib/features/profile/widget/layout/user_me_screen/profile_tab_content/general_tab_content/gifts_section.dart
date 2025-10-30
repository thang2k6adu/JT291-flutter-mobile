import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/ui/icon_label.dart';

class GiftsSection extends StatelessWidget {
  const GiftsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gifts',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.gray[8],
          ),
        ),
        const SizedBox(height: 12),
        const GiftsContainer(),
      ],
    );
  }
}

class GiftsContainer extends StatelessWidget {
  const GiftsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.pink[3], AppColors.pink[6]],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(child: GiftItem(label: 'Rocket', icon: AppIcons.rocketRed)),
            Expanded(child: GiftItem(label: 'Flower', icon: AppIcons.flower)),
            Expanded(child: GiftItem(label: 'Crown', icon: AppIcons.grown)),
            const Expanded(child: GiftsCounter()),
          ],
        ),
      ),
    );
  }
}

class GiftItem extends StatelessWidget {
  final String label;
  final String icon;
  final Color? color;

  const GiftItem({
    super.key,
    required this.label,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconLabel(
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color:  color ?? Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(icon, width: 24, height: 24),
      ),
      label: label,
      spacing: 4,
    );
  }
}

class GiftsCounter extends StatelessWidget {
  const GiftsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '180',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'Gifts',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}