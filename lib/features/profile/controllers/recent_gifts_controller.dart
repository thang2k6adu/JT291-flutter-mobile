import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/providers/gift/recent_gifts_provider.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_transaction_model.dart';

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

  /// Get gifts from a specific sender
  List<GiftTransactionModel> getGiftsFromSender(String senderId) {
    return ref.read(myRecentGiftsProvider.notifier).getGiftsFromSender(senderId);
  }

  /// Get gifts of a specific type
  List<GiftTransactionModel> getGiftsByType(String giftId) {
    return ref.read(myRecentGiftsProvider.notifier).getGiftsByType(giftId);
  }

  /// Get most recent gift
  GiftTransactionModel? getMostRecentGift() {
    return ref.read(myRecentGiftsProvider.notifier).getMostRecentGift();
  }

  /// Get gifts within a date range
  List<GiftTransactionModel> getGiftsInDateRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    return ref.read(myRecentGiftsProvider.notifier).getGiftsInDateRange(
      startDate,
      endDate,
    );
  }

  /// Format timestamp for display
  String formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Vừa xong';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inDays < 1) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ngày trước';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks tuần trước';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months tháng trước';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years năm trước';
    }
  }

  /// Format gift quantity display
  String formatGiftQuantity(int quantity) {
    if (quantity == 1) {
      return '';
    } else if (quantity < 1000) {
      return 'x$quantity';
    } else if (quantity < 1000000) {
      final k = (quantity / 1000).toStringAsFixed(1);
      return 'x${k}K';
    } else {
      final m = (quantity / 1000000).toStringAsFixed(1);
      return 'x${m}M';
    }
  }

  /// Show sender profile
  void showSenderProfile(BuildContext context, String senderId) {
    // TODO: Navigate to user profile
    showInfoMessage(context, 'Xem profile người gửi: $senderId');
  }

  /// Show gift details
  void showGiftDetails(BuildContext context, GiftTransactionModel transaction) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(transaction.giftInfo.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Người gửi: ${transaction.sender.nickname}'),
            const SizedBox(height: 8),
            Text('Số lượng: ${transaction.giftInfo.quantity}'),
            const SizedBox(height: 8),
            Text('Thời gian: ${formatTimestamp(transaction.timestamp)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
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

  /// Check if there are any gifts
  bool hasGifts() {
    return getTotalGiftsCount() > 0;
  }

  /// Get unique senders count
  int getUniqueSendersCount() {
    final gifts = ref.read(myRecentGiftsProvider).value ?? [];
    final senderIds = gifts.map((g) => g.sender.id).toSet();
    return senderIds.length;
  }

  /// Get total quantity of all gifts received
  int getTotalQuantityReceived() {
    final gifts = ref.read(myRecentGiftsProvider).value ?? [];
    return gifts.fold(0, (sum, gift) => sum + gift.giftInfo.quantity);
  }
}

