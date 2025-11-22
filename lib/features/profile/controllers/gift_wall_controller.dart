import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/gift_wall_provider.dart';

/// Provider cho GiftWallController
final giftWallControllerProvider = 
    NotifierProvider<GiftWallController, void>(GiftWallController.new);

/// Controller để quản lý gift wall interactions và UI logic
class GiftWallController extends Notifier<void> {
  @override
  void build() {
    // Controller initialization
  }

  /// Load more gift wall milestones
  Future<void> loadMore() async {
    try {
      await ref.read(myGiftWallProvider.notifier).loadMore();
    } catch (e) {
      print('GiftWallController: loadMore error: $e');
    }
  }

  /// Refresh gift wall milestones
  Future<void> refresh() async {
    try {
      await ref.read(myGiftWallProvider.notifier).refresh();
    } catch (e) {
      print('GiftWallController: refresh error: $e');
    }
  }

  /// Check if a milestone is completed
  bool isMilestoneCompleted(String milestoneId) {
    final milestones = ref.read(myGiftWallProvider).value ?? [];
    final milestone = milestones.firstWhere(
      (m) => m.id == milestoneId,
      orElse: () => milestones.first,
    );
    return ref.read(myGiftWallProvider.notifier).isMilestoneCompleted(milestone);
  }

  /// Get progress percentage for a milestone (0.0 to 1.0)
  double getMilestoneProgress(String milestoneId) {
    final milestones = ref.read(myGiftWallProvider).value ?? [];
    final milestone = milestones.firstWhere(
      (m) => m.id == milestoneId,
      orElse: () => milestones.first,
    );
    return ref.read(myGiftWallProvider.notifier).getMilestoneProgress(milestone);
  }

  /// Get completed milestones count
  int getCompletedCount() {
    return ref.read(myGiftWallProvider.notifier).getCompletedCount();
  }

  /// Get total milestones count
  int getTotalCount() {
    return ref.read(myGiftWallProvider.notifier).getTotalCount();
  }

  /// Show success snackbar
  void showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Show error snackbar
  void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Show info snackbar
  void showInfoMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

