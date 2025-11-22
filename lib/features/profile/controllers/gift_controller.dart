import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/gift_provider.dart';
import 'package:jt291_flutter_mobile/data/services/gift_service.dart';

/// Controller để quản lý gift interactions và UI logic
class GiftController extends AutoDisposeNotifier<void> {
  late final GiftService _service;

  @override
  void build() {
    _service = ref.read(giftServiceProvider);
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
  Future<({bool success, String message})> sendGift({
    required String recipientId,
    required String itemId,
    required int quantity,
  }) async {
    try {
      print(
        'GiftController: sendGift itemId=$itemId to $recipientId, qty=$quantity',
      );

      // TODO: Implement send gift API call when ready
      final success = await ref
          .read(giftServiceProvider)
          .sendGift(
            recipientId: recipientId,
            itemId: itemId,
            quantity: quantity,
          );

      // Mock success for now
      // await Future.delayed(const Duration(milliseconds: 500));

      if (success?.error == false) {
        return (success: true, message: "Đã gửi quà thành công!");
      } else {
        return (
          success: false,
          message: success?.message ?? "Có lỗi xảy ra khi gửi quà",
        );
      }
    } catch (e) {
      print('GiftController: sendGift error: $e');
      return (success: false, message: "Có lỗi xảy ra khi gửi quà");
    }
  }
}

/// Provider controller để inject vào UI
final giftControllerProvider =
    AutoDisposeNotifierProvider<GiftController, void>(GiftController.new);
