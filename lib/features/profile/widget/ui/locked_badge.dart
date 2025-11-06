// Red "Locked" badge with icon
import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';

/// Badge dạng pill màu đỏ có icon khóa và text
/// - [label]: văn bản hiển thị (mặc định "Locked")
/// - [color]: màu nền badge
/// - [iconSize], [textStyle], [padding] có thể tuỳ chỉnh
class LockedBadge extends StatelessWidget {
  final String label;
  final Color? color;
  final double iconSize;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;

  const LockedBadge({
    super.key,
    this.label = 'Locked',
    this.color = const Color(0xFFD93B3B),
    this.iconSize = 14,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveTextStyle = textStyle ??
        Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12);
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
          SvgIconSimple.asset(AppIcons.shield, size: iconSize),
          SizedBox(width: 2),
          Text(label, style: effectiveTextStyle),
        ],
      ),
    );
  }
}