import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/inventory_provider.dart';
import 'package:jt291_flutter_mobile/data/services/gift_service.dart';

/// Controller để quản lý inventory interactions và UI logic
class InventoryController extends AutoDisposeNotifier<void> {
  @override
  void build() {
    // Controller initialization
  }

  /// Load more inventory items
  Future<void> loadMore() async {
    try {
      await ref.read(myInventoryProvider.notifier).loadMore();
    } catch (e) {
      print('InventoryController: loadMore error: $e');
    }
  }

  /// Refresh inventory
  Future<void> refresh() async {
    try {
      await ref.read(myInventoryProvider.notifier).refresh();
    } catch (e) {
      print('InventoryController: refresh error: $e');
    }
  }

  /// Send gift from inventory to another user
  Future<bool> sendGift(
    BuildContext context, {
    required String recipientId,
    required String itemId,
    required int quantity,
  }) async {
    try {
      print('InventoryController: sendGift itemId=$itemId to user $recipientId, qty=$quantity');

      final service = ref.read(giftServiceProvider);
      final response = await service.sendGift(
        recipientId: recipientId,
        itemId: itemId,
        quantity: quantity,
      );

      if (response?.error == false) {
        // Update local inventory state to reflect the sent gift
        ref.read(myInventoryProvider.notifier).updateItemQuantity(itemId, quantity);

        _showSuccessSnackBar(context, "Đã gửi quà thành công!");
        return true;
      } else {
        _showErrorSnackBar(context, response?.message ?? "Có lỗi xảy ra khi gửi quà");
        return false;
      }
    } catch (e) {
      print('InventoryController: sendGift error: $e');
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
final inventoryControllerProvider = AutoDisposeNotifierProvider<InventoryController, void>(
  InventoryController.new,
);
