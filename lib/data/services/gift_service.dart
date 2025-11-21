import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/models/gift/inventory_item_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/gift_mock.dart';
import 'package:jt291_flutter_mobile/data/mocks/inventory_mock.dart';
// import 'package:jt291_flutter_mobile/data/services/api_service.dart'; // TODO: uncomment when API ready

/// Service for Gift-related operations
class GiftService {
  // final ApiService _apiService = ApiService(); // TODO: uncomment when API ready

  GiftService();

  /// GET /gifts
  /// Lấy danh sách gifts có sẵn trong catalog
  /// 
  /// Parameters:
  /// - [category]: all, hot, event, lucky, friendship, vip. Default: all
  /// - [page]: số trang, default: 1
  /// - [limit]: số items/page, default: 20, max: 50
  Future<ApiResponse<PaginatedData<GiftModel>>?> getGifts({
    String category = 'hot',
    int page = 1,
    int limit = 20,
  }) async {
    print('GiftService.getGifts: category=$category, page=$page, limit=$limit');

    // TODO: Implement API call when ready
    // Uncomment khi API ready:
    // try {
    //   final response = await _apiService.get(
    //     '/gifts',
    //     queryParameters: {
    //       'category': category,
    //       'page': page,
    //       'limit': limit,
    //     },
    //   );
    //   return ApiResponse.fromJson(
    //     response,
    //     (json) => PaginatedData.fromList(
    //       json as Map<String, dynamic>,
    //       (item) => GiftModel.fromJson(item as Map<String, dynamic>),
    //     ),
    //   );
    // } catch (e) {
    //   print('GiftService.getGifts error: $e');
    //   rethrow;
    // }

    // Mock data
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Validate category
    final validCategories = ['hot', 'event', 'lucky', 'friendship', 'vip'];
    if (!validCategories.contains(category.toLowerCase())) {
      return GiftMock.getPaginatedErrorResponse(
        code: 40001,
        message: 'Invalid category',
      );
    }

    // Validate limit
    if (limit > 50) {
      return GiftMock.getPaginatedErrorResponse(
        code: 40002,
        message: 'Limit cannot exceed 50',
      );
    }

    return GiftMock.getPaginatedGiftList(
      category: category,
      page: page,
      limit: limit,
    );
  }

  /// GET /users/me/inventory
  /// Lấy danh sách gifts trong inventory của user hiện tại (chính mình)
  /// 
  /// Parameters:
  /// - [page]: số trang, default: 1
  /// - [limit]: số items/page, default: 20, max: 50
  Future<ApiResponse<PaginatedData<InventoryItemModel>>?> getMyInventory({
    int page = 1,
    int limit = 20,
  }) async {
    print('GiftService.getMyInventory: page=$page, limit=$limit');

    // TODO: Implement API call when ready
    // Uncomment khi API ready:
    // try {
    //   final response = await _apiService.get(
    //     '/users/me/inventory',
    //     queryParameters: {
    //       'page': page,
    //       'limit': limit,
    //     },
    //   );
    //   return ApiResponse.fromJson(
    //     response,
    //     (json) => PaginatedData.fromJson(
    //       json as Map<String, dynamic>,
    //       (item) => InventoryItemModel.fromJson(item as Map<String, dynamic>),
    //     ),
    //   );
    // } catch (e) {
    //   print('GiftService.getMyInventory error: $e');
    //   rethrow;
    // }

    // Mock data
    await Future.delayed(const Duration(milliseconds: 500));

    // Validate limit
    if (limit > 50) {
      return InventoryMock.getErrorResponse(
        code: 40002,
        message: 'Limit cannot exceed 50',
      );
    }

    return InventoryMock.getMyInventory(
      page: page,
      limit: limit,
    );
  }

  /// POST /gifts/send
  /// Gửi gift từ inventory của user tới một user khác
  /// 
  /// Parameters:
  /// - [recipientId]: ID của người nhận
  /// - [itemId]: ID của gift item cần gửi
  /// - [quantity]: Số lượng cần gửi
  /// 
  /// Request body:
  /// ```json
  /// {
  ///   "recipient_id": 2001,
  ///   "item_id": 101,
  ///   "quantity": 1
  /// }
  /// ```
  Future<ApiResponse<Map<String, dynamic>>?> sendGift({
    required int recipientId,
    required int itemId,
    required int quantity,
  }) async {
    print('GiftService.sendGift: recipientId=$recipientId, itemId=$itemId, quantity=$quantity');

    // TODO: Implement API call when ready
    // Uncomment khi API ready:
    // try {
    //   final response = await _apiService.post(
    //     '/gifts/send',
    //     data: {
    //       'recipient_id': recipientId,
    //       'item_id': itemId,
    //       'quantity': quantity,
    //     },
    //   );
    //   return ApiResponse.fromJson(
    //     response,
    //     (json) => json as Map<String, dynamic>,
    //   );
    // } catch (e) {
    //   print('GiftService.sendGift error: $e');
    //   rethrow;
    // }

    // Mock data
    await Future.delayed(const Duration(milliseconds: 800));

    // Validation
    if (quantity <= 0) {
      return InventoryMock.sendGiftError(
        code: 40004,
        message: 'Quantity must be greater than 0',
      );
    }

    if (recipientId <= 0) {
      return InventoryMock.sendGiftError(
        code: 40005,
        message: 'Invalid recipient ID',
      );
    }

    // Simulate success
    return InventoryMock.sendGiftSuccess(
      recipientId: recipientId,
      itemId: itemId,
      quantity: quantity,
    );
  }
}

/// Provider cho GiftService
final giftServiceProvider = Provider<GiftService>((ref) {
  return GiftService();
});
