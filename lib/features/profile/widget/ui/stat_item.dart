import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final String? count; // Cho phép null
  final String label;
  final Widget? icon;

  const StatItem({
    super.key,
    this.count,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (icon != null)
          icon!
        else if (count != null)
          Text(
            count!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        else
          const SizedBox.shrink(), // tránh layout lỗi nếu không có gì

        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
