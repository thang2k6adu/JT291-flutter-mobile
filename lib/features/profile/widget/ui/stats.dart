import 'package:flutter/material.dart';

class UserStatItem extends StatelessWidget {
  final String value;
  final String label;
  final TextStyle? valueStyle;
  final TextStyle? labelStyle;
  final double spacing;

  const UserStatItem({
    super.key,
    required this.value,
    required this.label,
    this.valueStyle,
    this.labelStyle,
    this.spacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: valueStyle ??
              Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: spacing),
        Text(
          label,
          style: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
