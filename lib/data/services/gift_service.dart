import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_transaction_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/gift_mock.dart';
import 'package:jt291_flutter_mobile/data/mocks/inventory_mock.dart';
import 'package:jt291_flutter_mobile/data/mocks/gift_transaction_mock.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';

// import 'package:jt291_flutter_mobile/data/services/api_service.dart'; // TODO: uncomment when API ready

/// Service for Gift-related operations
class GiftService {
  // final ApiService _apiService = ApiService(); // TODO: uncomment when API ready

  GiftService();
  final ApiService _apiService = ApiService();

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
    try {
      final response = await _apiService.get(
        '/gifts/items',
        queryParameters: {'type': category, 'page': page, 'limit': limit},
      );
      return ApiResponse.fromJson(
        response,
        (json) => PaginatedData.fromJson(
          json as Map<String, dynamic>,
          (item) => GiftModel.fromJson(item as Map<String, dynamic>),
        ),
      );
    } catch (e) {
      print('GiftService.getGifts error: $e');
      rethrow;
    }

    // Mock data
    // await Future.delayed(const Duration(milliseconds: 500));

    // // Validate category
    // final validCategories = ['hot', 'event', 'lucky', 'friendship', 'vip'];
    // if (!validCategories.contains(category.toLowerCase())) {
    //   return GiftMock.getPaginatedErrorResponse(
    //     code: 40001,
    //     message: 'Invalid category',
    //   );
    // }

    // // Validate limit
    // if (limit > 50) {
    //   return GiftMock.getPaginatedErrorResponse(
    //     code: 40002,
    //     message: 'Limit cannot exceed 50',
    //   );
    // }

    // return GiftMock.getPaginatedGiftList(
    //   category: category,
    //   page: page,
    //   limit: limit,
    // );
  }

  /// GET /users/me/inventory
  /// Lấy danh sách gifts trong inventory của user hiện tại (chính mình)
  ///
  /// Parameters:
  /// - [page]: số trang, default: 1
  /// - [limit]: số items/page, default: 20, max: 50
  Future<ApiResponse<PaginatedData<GiftModel>>?> getMyInventory({
    int page = 1,
    int limit = 20,
  }) async {
    print('GiftService.getMyInventory: page=$page, limit=$limit');

    // TODO: Implement API call when ready
    // Uncomment khi API ready:
    try {
      final response = await _apiService.get(
        '/gifts/inventory',
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );
      return ApiResponse.fromJson(
        response,
        (json) => PaginatedData.fromJson(
          json as Map<String, dynamic>,
          (item) => GiftModel.fromJson(item as Map<String, dynamic>),
        ),
      );
    } catch (e) {
      print('GiftService.getMyInventory error: $e');
      rethrow;
    }

    // // Mock data
    // await Future.delayed(const Duration(milliseconds: 500));

    // // Validate limit
    // if (limit > 50) {
    //   return InventoryMock.getErrorResponse(
    //     code: 40002,
    //     message: 'Limit cannot exceed 50',
    //   );
    // }

    // return InventoryMock.getMyInventory(page: page, limit: limit);
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
    required String recipientId,
    required String itemId,
    required int quantity,
  }) async {
    print(
      'GiftService.sendGift: recipientId=$recipientId, itemId=$itemId, quantity=$quantity',
    );

    // TODO: Implement API call when ready
    // Uncomment khi API ready:
    try {
      final response = await _apiService.post(
        '/gifts',
        data: {
          'receiver_id': recipientId,
          'gift_item_id': itemId,
          'quantity': quantity,
          'message': "Test Message",
        },
      );
      return ApiResponse.fromJson(
        response,
        (json) => json as Map<String, dynamic>,
      );
    } catch (e) {
      print('GiftService.sendGift error: $e');
      rethrow;
    }

    // Mock data
    // await Future.delayed(const Duration(milliseconds: 800));

    // print(
    //   'GiftService.sendGift: recipientId=$recipientId, itemId=$itemId, quantity=$quantity',
    // );
    // // Validation
    // if (quantity <= 0) {
    //   return InventoryMock.sendGiftError(
    //     code: 40004,
    //     message: 'Quantity must be greater than 0',
    //   );
    // }

    // print('GiftService.sendGift: sending gift success');

    // // Simulate success
    // final response = InventoryMock.sendGiftSuccess(
    //   recipientId: recipientId,
    //   itemId: itemId,
    //   quantity: quantity,
    // );

    // print('GiftService.sendGift: response=$response');

    // return response;
  }

  /// GET /users/{user_id}/gift-wall-milestones
  /// Lấy danh sách gift milestones trên tường quà của một user
  ///
  /// Parameters:
  /// - [userId]: ID của user cần xem gift wall
  /// - [page]: số trang, default: 1
  /// - [limit]: số items/page, default: 10, max: 50
  Future<ApiResponse<PaginatedData<GiftModel>>?> getGiftWallMilestones({
    required String userId,
    int page = 1,
    int limit = 10,
  }) async {
    print(
      'GiftService.getGiftWallMilestones: userId=$userId, page=$page, limit=$limit',
    );

    // TODO: Implement API call when ready
    // Uncomment khi API ready:
    // try {
    //   final response = await _apiService.get(
    //     '/users/$userId/gift-wall-milestones',
    //     queryParameters: {
    //       'page': page,
    //       'limit': limit,
    //     },
    //   );
    //   return ApiResponse.fromJson(
    //     response,
    //     (json) => PaginatedData.fromJson(
    //       json as Map<String, dynamic>,
    //       (item) => GiftModel.fromJson(item as Map<String, dynamic>),
    //     ),
    //   );
    // } catch (e) {
    //   print('GiftService.getGiftWallMilestones error: $e');
    //   rethrow;
    // }

    // Mock data
    await Future.delayed(const Duration(milliseconds: 500));

    // Validate limit
    if (limit > 50) {
      return GiftMock.getPaginatedErrorResponse(
        code: 40002,
        message: 'Limit cannot exceed 50',
      );
    }

    return GiftMock.getGiftWallMilestones(
      userId: userId,
      page: page,
      limit: limit,
    );
  }

  /// GET /users/{user_id}/gift/recent-gifts
  /// Lấy lịch sử quà tặng gần đây của một user
  ///
  /// Parameters:
  /// - [userId]: ID của user cần xem lịch sử quà
  /// - [page]: số trang, default: 1
  /// - [limit]: số items/page, default: 20, max: 50
  Future<ApiResponse<PaginatedData<GiftTransactionModel>>?> getRecentGifts({
    required String userId,
    int page = 1,
    int limit = 20,
  }) async {
    print(
      'GiftService.getRecentGifts: userId=$userId, page=$page, limit=$limit',
    );

    // TODO: Implement API call when ready
    // Uncomment khi API ready:
    // try {
    //   final response = await _apiService.get(
    //     '/users/$userId/gift/recent-gifts',
    //     queryParameters: {
    //       'page': page,
    //       'limit': limit,
    //     },
    //   );
    //   return ApiResponse.fromJson(
    //     response,
    //     (json) => PaginatedData.fromJson(
    //       json as Map<String, dynamic>,
    //       (item) => GiftTransactionModel.fromJson(item as Map<String, dynamic>),
    //     ),
    //   );
    // } catch (e) {
    //   print('GiftService.getRecentGifts error: $e');
    //   rethrow;
    // }

    // Mock data
    await Future.delayed(const Duration(milliseconds: 500));

    // Validate limit
    if (limit > 50) {
      return GiftTransactionMock.getErrorResponse(
        code: 40002,
        message: 'Limit cannot exceed 50',
      );
    }

    return GiftTransactionMock.getRecentGifts(
      userId: userId,
      page: page,
      limit: limit,
    );
  }
}

/// Provider cho GiftService
final giftServiceProvider = Provider<GiftService>((ref) {
  return GiftService();
});
