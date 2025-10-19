import 'package:flutter/material.dart';
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
  const GiftsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.pink[3]!, AppColors.pink[6]!],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(child: GiftItem(label: 'Rocket', icon: Icons.rocket_launch, color: AppColors.red[5]!)),
            Expanded(child: GiftItem(label: 'Flower', icon: Icons.local_florist, color: AppColors.orange[5]!)),
            Expanded(child: GiftItem(label: 'Crown', icon: Icons.workspace_premium, color: AppColors.amber[5]!)),
            const Expanded(child: GiftsCounter()),
          ],
        ),
      ),
    );
  }
}

class GiftItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const GiftItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconLabel(
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
      label: label,
      spacing: 4,
    );
  }
}

class GiftsCounter extends StatelessWidget {
  const GiftsCounter({Key? key}) : super(key: key);

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