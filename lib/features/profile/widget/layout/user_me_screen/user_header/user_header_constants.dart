import 'package:flutter/material.dart';

class UserHeaderConstants {
  // Colors
  static const Color crownBadgeColor = Color(0xFFFF8C00);
  static const Color crownIconColor = Color(0xFFFFA500);
  static const Color diamondBadgeColor = Color(0xFF10B981);
  static const Color diamondIconColor = Color(0xFF0EA95F);
  
  // Sizes
  static const double badgePadding = 8.0;
  static const double badgeVerticalPadding = 2.0;
  static const double badgeBorderRadius = 40.0;
  static const double iconSize = 16.0;
  static const double iconGap = 6.0;
  static const double minBadgeWidth = 40.0;
  
  // Spacing
  static const double badgeSpacing = 8.0;
  static const double textSpacing = 12.0;
  static const double sectionSpacing = 12.0;
  
  // SVG Icons
  static const String crownSvg = '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M5 16L3 8L8.5 10L12 4L15.5 10L21 8L19 16H5Z" fill="white"/>
    <path d="M5 16H19V18H5V16Z" fill="white"/>
  </svg>''';
  
  static const String diamondSvg = '''<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M12 2L6 8L12 14L18 8L12 2Z" fill="white"/>
  </svg>''';
}
