import 'package:flutter/material.dart';

class QuickAccessRow extends StatelessWidget {
  const QuickAccessRow({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('👑', 'Vip', Colors.purple.shade100),
      ('🦄', 'Store', Colors.blue.shade100),
      ('🎯', 'Task Center', Colors.blue.shade100),
      ('❤️', 'Love Space', Colors.pink.shade100),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items
            .map((e) => _QuickAccessItem(
                  emoji: e.$1,
                  label: e.$2,
                  bgColor: e.$3,
                ))
            .toList(),
      ),
    );
  }
}

class _QuickAccessItem extends StatelessWidget {
  final String emoji;
  final String label;
  final Color bgColor;

  const _QuickAccessItem({
    required this.emoji,
    required this.label,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(emoji, style: const TextStyle(fontSize: 30)),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
