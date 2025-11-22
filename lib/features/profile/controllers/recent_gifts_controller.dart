import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/recent_gifts_provider.dart';

/// Provider cho RecentGiftsController
final recentGiftsControllerProvider = 
    NotifierProvider<RecentGiftsController, void>(RecentGiftsController.new);

/// Controller để quản lý recent gifts interactions và UI logic
class RecentGiftsController extends Notifier<void> {
  @override
  void build() {
    // Controller initialization
  }

  /// Load more recent gifts
  Future<void> loadMore() async {
    try {
      await ref.read(myRecentGiftsProvider.notifier).loadMore();
    } catch (e) {
      print('RecentGiftsController: loadMore error: $e');
    }
  }

  /// Refresh recent gifts
  Future<void> refresh() async {
    try {
      await ref.read(myRecentGiftsProvider.notifier).refresh();
    } catch (e) {
      print('RecentGiftsController: refresh error: $e');
    }
  }

  /// Get total gifts count
  int getTotalGiftsCount() {
    return ref.read(myRecentGiftsProvider.notifier).getTotalGiftsCount();
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
