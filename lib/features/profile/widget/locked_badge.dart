// Red "Locked" badge with icon
import 'package:flutter/material.dart';

/// Badge dạng pill màu đỏ có icon khóa và text
/// - [label]: văn bản hiển thị (mặc định "Locked")
/// - [color]: màu nền badge
/// - [iconSize], [textStyle], [padding] có thể tuỳ chỉnh
class LockedBadge extends StatelessWidget {
  final String label;
  final Color color;
  final double iconSize;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;

  const LockedBadge({
    Key? key,
    this.label = 'Locked',
    this.color = const Color(0xFFD93B3B),
    this.iconSize = 14,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveTextStyle = textStyle ??
        Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w600);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lock, size: iconSize, color: Colors.white),
          const SizedBox(width: 6),
          Text(label, style: effectiveTextStyle),
        ],
      ),
    );
  }
}