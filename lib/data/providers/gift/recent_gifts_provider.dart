import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_transaction_model.dart';
import 'package:jt291_flutter_mobile/data/services/gift_service.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';

/// Provider để quản lý recent gifts (lịch sử quà tặng) của user hiện tại
final myRecentGiftsProvider = 
    AsyncNotifierProvider<MyRecentGiftsNotifier, List<GiftTransactionModel>>(
  MyRecentGiftsNotifier.new,
);

/// Notifier xử lý recent gifts cho user hiện tại
class MyRecentGiftsNotifier extends BasePaginatedNotifier<GiftTransactionModel> {
  late final GiftService _service;

  @override
  Future<List<GiftTransactionModel>> build() async {
    _service = ref.read(giftServiceProvider);
    print('MyRecentGiftsNotifier.build: loading recent gifts');
    return super.build();
  }

  @override
  Future<PaginatedResponse<GiftTransactionModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    // Lấy user ID của người dùng hiện tại
    final user = ref.watch(userGeneralProvider);
    final userId = user.value?.unionId;
    
    if (userId == null) {
      // User chưa đăng nhập hoặc chưa load xong
      throw Exception('User ID is null');
    }

    print('MyRecentGiftsNotifier.fetchPage: userId=$userId, page=$page, limit=$limit');

    final apiResponse = await _service.getRecentGifts(
      userId: userId,
      page: page,
      limit: limit,
    );

    print('Recent Gifts apiResponse (provider): ${apiResponse?.message}');

    // Wrap bằng ApiPaginatedResponse chuẩn từ base class
    final recentGiftsResponse = ApiPaginatedResponse<GiftTransactionModel>(apiResponse!);

    // Log error nếu có
    if (recentGiftsResponse.hasError) {
      print('Get recent gifts error: ${recentGiftsResponse.errorMessage}');
    }

    return recentGiftsResponse;
  }

  /// Get total gifts count
  int getTotalGiftsCount() {
    return state.value?.length ?? 0;
  }

  /// Get gifts from a specific sender
  List<GiftTransactionModel> getGiftsFromSender(String senderId) {
    final gifts = state.value ?? [];
    return gifts.where((gift) => gift.sender.id == senderId).toList();
  }

  /// Get gifts of a specific type
  List<GiftTransactionModel> getGiftsByType(String giftId) {
    final gifts = state.value ?? [];
    return gifts.where((gift) => gift.giftInfo.id == giftId).toList();
  }

  /// Get most recent gift
  GiftTransactionModel? getMostRecentGift() {
    final gifts = state.value ?? [];
    if (gifts.isEmpty) return null;
    return gifts.first; // Assuming list is sorted by timestamp desc
  }

  /// Get gifts within a date range
  List<GiftTransactionModel> getGiftsInDateRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    final gifts = state.value ?? [];
    return gifts.where((gift) {
      return gift.timestamp.isAfter(startDate) && 
             gift.timestamp.isBefore(endDate);
    }).toList();
  }
}
