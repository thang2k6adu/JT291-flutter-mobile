import 'package:flutter/material.dart';

/// Badge dạng pill với icon ở bên trái và số (hoặc text) ở bên phải.
/// - [icon]: widget hiển thị icon, có thể là Icon, Image, SvgPicture...
/// - [count]: số hoặc text hiển thị bên phải icon
/// - [backgroundColor]: màu nền của toàn badge
/// - [iconBackgroundColor]: màu nền của icon tròn
/// - [textColor]: màu text hiển thị
/// - [borderColor], [borderWidth]: màu và độ dày viền badge (tuỳ chọn)
/// - [padding]: khoảng cách padding bên trong badge
/// - [borderRadius]: bo góc badge
/// - [iconSize]: kích thước icon
/// - [gap]: khoảng cách giữa icon và count
/// - [textStyle]: tuỳ chỉnh style của text
/// - [showShadow]: bật/tắt shadow của badge
/// - [onTap]: callback khi nhấn vào badge (tuỳ chọn)
/// - [minWidth]: đảm bảo width tối thiểu cho pill, để pill luôn tròn đẹp với số nhỏ
class IconNumberBadge extends StatelessWidget {
  final Widget icon;
  final String count;
  final Color backgroundColor;
  final Color textColor;
  final Color iconBackgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double iconSize;
  final double gap;
  final TextStyle? textStyle;
  final bool showShadow;
  final VoidCallback? onTap;
  final double minWidth; // đảm bảo pill tròn đẹp

  const IconNumberBadge({
    super.key,
    required this.icon,
    required this.count,
    this.backgroundColor = const Color(0xFF10B981), // green
    this.iconBackgroundColor = const Color(0xFF0EA95F),
    this.textColor = Colors.white,
    this.borderColor,
    this.borderWidth = 0.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    this.borderRadius = 20.0,
    this.iconSize = 18.0,
    this.gap = 8.0,
    this.textStyle,
    this.showShadow = true,
    this.onTap,
    this.minWidth = 44.0,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveTextStyle = textStyle ??
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            );

    final badge = Container(
      padding: padding,
      constraints: BoxConstraints(minWidth: minWidth),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null ? Border.all(color: borderColor!, width: borderWidth) : null,
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: backgroundColor.withOpacity(0.25),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                )
              ]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon container (tròn)
          Container(
            width: iconSize + 8,
            height: iconSize + 8,
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SizedBox(
                width: iconSize,
                height: iconSize,
                child: IconTheme(
                  data: IconThemeData(size: iconSize, color: textColor),
                  child: icon,
                ),
              ),
            ),
          ),
          SizedBox(width: gap),
          // Count text
          Text(
            count,
            style: effectiveTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: badge,
        ),
      );
    } else {
      return badge;
    }
  }
}
