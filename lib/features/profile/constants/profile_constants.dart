/// Constants cho Profile Feature
class ProfileConstants {
  // Draggable Sheet Configuration
  static const double initialChildSize = 0.87;
  static const double minChildSize = 0.12;
  static const double maxChildSize = 1.0;
  
  // Animation Configuration
  static const double maxPadding = 120.0;
  static const double paddingThreshold = 0.95;
  static const double paddingRange = 0.05; // 0.95 to 1.0
  
  // Avatar Configuration
  static const double avatarSize = 90.0;
  static const double avatarOffset = 240.0;
  static const double avatarAnimationRange = 700.0;
  
  // Tab Configuration
  static const int tabCount = 2;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Gesture Configuration
  static const double gestureThreshold = 10.0;
  static const double scrollThreshold = 0.01;
  
  // UI Spacing
  static const double sectionSpacing = 16.0;
  static const double paddingHorizontal = 16.0;
  static const double handleHeight = 50.0;
  static const double handleWidth = 40.0;
  static const double handleThickness = 5.0;
}
