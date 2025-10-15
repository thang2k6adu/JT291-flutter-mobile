import 'package:flutter/material.dart';

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _FeatureItem(emoji: '💎', label: 'Vip'),
            _FeatureItem(emoji: '🛒', label: 'Store'),
            _FeatureItem(emoji: '🎯', label: 'Task Center'),
            _FeatureItem(emoji: '💗', label: 'Love Space'),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String emoji;
  final String label;

  const _FeatureItem({
    required this.emoji,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          emoji,
          style: const TextStyle(fontSize: 32),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}