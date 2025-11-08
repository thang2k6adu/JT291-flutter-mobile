import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class MonthlyCardOption extends StatelessWidget {
  final bool isSelected;
  final String diamonds;
  final String dailyReward;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback? onTap;

  const MonthlyCardOption({
    super.key,
    required this.isSelected,
    required this.diamonds,
    required this.dailyReward,
    this.backgroundColor = const Color(0xFFFFE4E6),
    this.borderColor = const Color(0xFFE65983),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? borderColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(AppIcons.diamondPng, width: 24, height: 24),
                      const SizedBox(width: 8),
                      Text(
                        diamonds,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Receive $dailyReward diamonds daily',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Image.asset(AppIcons.manyDiamondsPng, width: 92, height: 58),
          ],
        ),
      ),
    );
  }
}
