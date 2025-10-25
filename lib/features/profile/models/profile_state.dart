import 'package:flutter/material.dart';

/// State model cho Profile Screen
class ProfileState {
  final double currentExtent;
  final double scrollOffset;
  final bool isDragging;
  final bool isAnimating;
  final TabController? tabController;
  final DraggableScrollableController? draggableController;

  const ProfileState({
    this.currentExtent = 0.87,
    this.scrollOffset = 0.0,
    this.isDragging = false,
    this.isAnimating = false,
    this.tabController,
    this.draggableController,
  });

  ProfileState copyWith({
    double? currentExtent,
    double? scrollOffset,
    bool? isDragging,
    bool? isAnimating,
    TabController? tabController,
    DraggableScrollableController? draggableController,
  }) {
    return ProfileState(
      currentExtent: currentExtent ?? this.currentExtent,
      scrollOffset: scrollOffset ?? this.scrollOffset,
      isDragging: isDragging ?? this.isDragging,
      isAnimating: isAnimating ?? this.isAnimating,
      tabController: tabController ?? this.tabController,
      draggableController: draggableController ?? this.draggableController,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfileState &&
        other.currentExtent == currentExtent &&
        other.scrollOffset == scrollOffset &&
        other.isDragging == isDragging &&
        other.isAnimating == isAnimating;
  }

  @override
  int get hashCode {
    return currentExtent.hashCode ^
        scrollOffset.hashCode ^
        isDragging.hashCode ^
        isAnimating.hashCode;
  }
}
