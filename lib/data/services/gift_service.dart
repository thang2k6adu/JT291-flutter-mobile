import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/mocks/gift_mock.dart';
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
}

/// Provider cho GiftService
final giftServiceProvider = Provider<GiftService>((ref) {
  return GiftService();
});
