import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/gift_provider.dart';

/// Controller để quản lý gift interactions và UI logic
class GiftController extends AutoDisposeNotifier<void> {
  @override
  void build() {
    // Controller initialization
  }

  /// Load more gifts for a specific category
  Future<void> loadMore(String category) async {
    try {
      await ref.read(giftByCategoryProvider(category).notifier).loadMore();
    } catch (e) {
      print('GiftController: loadMore error: $e');
    }
  }

  /// Refresh gifts for a specific category
  Future<void> refresh(String category) async {
    try {
      await ref.read(giftByCategoryProvider(category).notifier).refresh();
    } catch (e) {
      print('GiftController: refresh error: $e');
    }
  }

  /// Send gift to user
  Future<bool> sendGift(
    BuildContext context, {
    required int giftId,
    required String recipientId,
    required int quantity,
  }) async {
    try {
      print('GiftController: sendGift giftId=$giftId to $recipientId, qty=$quantity');

      // TODO: Implement send gift API call when ready
      // final success = await ref.read(giftServiceProvider).sendGift(
      //   giftId: giftId,
      //   recipientId: recipientId,
      //   quantity: quantity,
      // );

      // Mock success for now
      await Future.delayed(const Duration(milliseconds: 500));

      _showSuccessSnackBar(context, "Đã gửi quà thành công!");
      return true;
    } catch (e) {
      print('GiftController: sendGift error: $e');
      _showErrorSnackBar(context, "Có lỗi xảy ra khi gửi quà");
      return false;
    }
  }

  /// Hiển thị success snackbar
  void _showSuccessSnackBar(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green[600],
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Hiển thị error snackbar
  void _showErrorSnackBar(BuildContext context, String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red[600],
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Đóng',
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}

/// Provider controller để inject vào UI
final giftControllerProvider = AutoDisposeNotifierProvider<GiftController, void>(
  GiftController.new,
);

