import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/profile/constants/profile_constants.dart';
import 'package:jt291_flutter_mobile/features/profile/models/profile_state.dart';

/// Controller quản lý DraggableSheet behavior
class DraggableSheetController extends AutoDisposeNotifier<ProfileState> {
  late DraggableScrollableController _draggableController;
  late ScrollController _scrollController;
  bool _isSyncing = false;

  @override
  ProfileState build() {
    _draggableController = DraggableScrollableController();
    _scrollController = ScrollController();

    // Add listeners
    _draggableController.addListener(_onExtentChanged);
    _scrollController.addListener(_onScrollChanged);

    return ProfileState(
      currentExtent: ProfileConstants.initialChildSize,
      draggableController: _draggableController,
    );
  }

  void dispose() {
    _draggableController.removeListener(_onExtentChanged);
    _scrollController.removeListener(_onScrollChanged);
    _draggableController.dispose();
    _scrollController.dispose();
  }

  void _onExtentChanged() {
    if (_isSyncing) return;

    _isSyncing = true;
    final newExtent = _draggableController.size;

    state = state.copyWith(currentExtent: newExtent, isDragging: true);
    // Sync scroll position
    _syncScrollFromDraggable();
    _isSyncing = false;
  }

  /// Update extent from external source
  void updateExtent(double extent) {
    state = state.copyWith(currentExtent: extent, isDragging: true);
  }

  void _onScrollChanged() {
    if (_isSyncing) return;

    _isSyncing = true;
    final newOffset = _scrollController.offset;

    state = state.copyWith(scrollOffset: newOffset, isDragging: false);

    // Sync draggable sheet
    _syncDraggableFromScroll();
    _isSyncing = false;
  }

  void _syncScrollFromDraggable() {
    if (!_scrollController.hasClients || _isSyncing) return;
    final extent = _draggableController.size;
    final maxScrollExtent = _scrollController.position.maxScrollExtent;

    if (maxScrollExtent > 0) {
      final normalizedExtent =
          (extent - ProfileConstants.minChildSize) /
          (ProfileConstants.maxChildSize - ProfileConstants.minChildSize);
      final targetOffset = normalizedExtent * maxScrollExtent;

      if ((_scrollController.offset - targetOffset).abs() >
          ProfileConstants.gestureThreshold) {
        _scrollController.jumpTo(targetOffset);
      }
    }
  }

  void _syncDraggableFromScroll() {
    if (!_scrollController.hasClients || _isSyncing) return;

    final scrollOffset = _scrollController.offset;
    final maxScrollExtent = _scrollController.position.maxScrollExtent;

    if (maxScrollExtent > 0) {
      final normalizedOffset = scrollOffset / maxScrollExtent;
      final targetExtent =
          ProfileConstants.minChildSize +
          normalizedOffset *
              (ProfileConstants.maxChildSize - ProfileConstants.minChildSize);

      if ((_draggableController.size - targetExtent).abs() >
          ProfileConstants.scrollThreshold) {
        _draggableController.jumpTo(
          targetExtent.clamp(
            ProfileConstants.minChildSize,
            ProfileConstants.maxChildSize,
          ),
        );
      }
    }
  }

  /// Jump to specific extent
  void jumpToExtent(double extent) {
    _draggableController.jumpTo(
      extent.clamp(
        ProfileConstants.minChildSize,
        ProfileConstants.maxChildSize,
      ),
    );
  }

  /// Animate to specific extent
  Future<void> animateToExtent(double extent) {
    return _draggableController.animateTo(
      extent.clamp(
        ProfileConstants.minChildSize,
        ProfileConstants.maxChildSize,
      ),
      duration: ProfileConstants.mediumAnimation,
      curve: Curves.easeInOut,
    );
  }

  /// Get current extent
  double get currentExtent => _draggableController.size;

  /// Get scroll controller
  ScrollController get scrollController => _scrollController;

  /// Get draggable controller
  DraggableScrollableController get draggableController => _draggableController;
}

/// Provider cho DraggableSheetController
final draggableSheetControllerProvider =
    AutoDisposeNotifierProvider<DraggableSheetController, ProfileState>(
      DraggableSheetController.new,
    );
