import 'package:flutter/material.dart';

/// Một item trong grid các tính năng
class FeatureItem {
  final String emoji;
  final String label;
  final VoidCallback? onTap;

  const FeatureItem({
    required this.emoji,
    required this.label,
    this.onTap,
  });
}

/// Widget hiển thị grid các tính năng
class FeaturesGrid extends StatelessWidget {
  final List<FeatureItem> items;

  const FeaturesGrid({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.primary, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items
              .map((item) => _FeatureItemWidget(item: item))
              .toList(),
        ),
      ),
    );
  }
}

class _FeatureItemWidget extends StatelessWidget {
  final FeatureItem item;

  const _FeatureItemWidget({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: item.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 8),
          Text(
            item.label,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
