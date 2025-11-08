import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';
import 'package:jt291_flutter_mobile/features/profile/controllers/draggable_sheet_controller.dart';
import 'package:jt291_flutter_mobile/features/profile/constants/profile_constants.dart';
import 'package:jt291_flutter_mobile/features/profile/models/profile_state.dart';

/// Main controller cho Profile Screen
class ProfileController extends AutoDisposeNotifier<ProfileState> {
  TabController? _tabController;
  EdgeInsets? _cachedTabBarPadding;
  double? _lastExtentForPadding;

  @override
  ProfileState build() {
    return ProfileState();
  }

  /// Initialize TabController with TickerProvider
  void initializeTabController(TickerProvider vsync) {
    _tabController?.dispose();
    _tabController = TabController(
      length: ProfileConstants.tabCount,
      vsync: vsync,
    );
    
    state = state.copyWith(tabController: _tabController);
  }

  void dispose() {
    _tabController?.dispose();
  }

  /// Update extent from draggable sheet
  void updateExtent(double extent) {
    state = state.copyWith(
      currentExtent: extent,
      isDragging: true,
    );
    // Clear padding cache when extent changes
    _clearPaddingCache();
  }

  /// Update scroll offset
  void updateScrollOffset(double offset) {
    state = state.copyWith(
      scrollOffset: offset,
      isDragging: false,
    );
  }

  /// Set dragging state
  void setDragging(bool isDragging) {
    state = state.copyWith(isDragging: isDragging);
  }

  /// Set animating state
  void setAnimating(bool isAnimating) {
    state = state.copyWith(isAnimating: isAnimating);
  }

  /// Calculate tab bar padding based on extent (with memoization)
  EdgeInsets getTabBarPadding() {
    final currentExtent = state.currentExtent;
    
    // Return cached result if extent hasn't changed
    if (_lastExtentForPadding == currentExtent && _cachedTabBarPadding != null) {
      return _cachedTabBarPadding!;
    }
    
    // Clamp currentExtent to valid range
    final clampedExtent = currentExtent.clamp(
      ProfileConstants.minChildSize,
      ProfileConstants.maxChildSize,
    );
    
    EdgeInsets padding;
    
    // Check if extent is above threshold
    if (clampedExtent >= ProfileConstants.paddingThreshold) {
      final extraExtent = clampedExtent - ProfileConstants.paddingThreshold;
      
      // Ensure paddingRange is not zero to avoid division by zero
      if (ProfileConstants.paddingRange <= 0) {
        padding = EdgeInsets.zero;
      } else {
        // Calculate padding value with bounds checking
        final normalizedExtra = extraExtent / ProfileConstants.paddingRange;
        final paddingValue = (normalizedExtra * ProfileConstants.maxPadding)
            .clamp(0.0, ProfileConstants.maxPadding);
        
        padding = EdgeInsets.only(top: paddingValue);
      }
    } else {
      padding = EdgeInsets.zero;
    }
    
    // Cache the result
    _cachedTabBarPadding = padding;
    _lastExtentForPadding = currentExtent;
    
    return padding;
  }

  /// Calculate floating avatar position
  Offset getFloatingAvatarPosition(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    final top = screenHeight - 
        ProfileConstants.avatarAnimationRange * 
        (state.currentExtent - ProfileConstants.minChildSize) / 
        (ProfileConstants.maxChildSize - ProfileConstants.minChildSize) - 
        ProfileConstants.avatarOffset;
    
    final left = screenWidth / 2 - ProfileConstants.avatarSize / 2;
    
    return Offset(left, top);
  }

  /// Get tab controller
  TabController? get tabController => _tabController;

  /// Get current extent
  double get currentExtent => state.currentExtent;

  /// Get scroll offset
  double get scrollOffset => state.scrollOffset;

  /// Check if dragging
  bool get isDragging => state.isDragging;

  /// Check if animating
  bool get isAnimating => state.isAnimating;

  /// Clear padding cache
  void _clearPaddingCache() {
    _cachedTabBarPadding = null;
    _lastExtentForPadding = null;
  }
}

/// Provider cho ProfileController
final profileControllerProvider = 
    AutoDisposeNotifierProvider<ProfileController, ProfileState>(
        ProfileController.new);

/// Combined provider cho Profile Screen
final profileScreenProvider = Provider<ProfileScreenData>((ref) {
  final profileState = ref.watch(profileControllerProvider);
  final draggableState = ref.watch(draggableSheetControllerProvider);
  final userGeneralAsync = ref.watch(userGeneralProvider);

  return ProfileScreenData(
    profileState: profileState,
    draggableState: draggableState,
    userGeneralAsync: userGeneralAsync,
  );
});

/// Data class cho Profile Screen
class ProfileScreenData {
  final ProfileState profileState;
  final ProfileState draggableState;
  final AsyncValue userGeneralAsync;

  const ProfileScreenData({
    required this.profileState,
    required this.draggableState,
    required this.userGeneralAsync,
  });
}
