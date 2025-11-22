import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_transaction_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';

/// Mock data cho gift transactions (lịch sử quà tặng gần đây)
class GiftTransactionMock {
  /// Mock danh sách gift transactions
    static final List<GiftTransactionModel> mockRecentGifts = List.generate(30, (index) {
    final id = (index + 1).toString();
    final requiredCount = (index % 10 + 1) * 5; // 5, 10, 15, ...
    final currentCount = (index % requiredCount).clamp(0, requiredCount);

    return GiftTransactionModel(
      id: id,
      sender: UserModel(
        id: id,
        nickname: 'User $id',
        avatar: 'https://i.pinimg.com/236x/d8/52/5b/d8525bda518ea185d4fe908bbce65126.jpg',
      ),
      giftInfo: GiftModel(
        id: id,
        name: 'Quà tặng $id',
        imageUrl: 'https://ecommerce-gk-bucket.s3.ap-southeast-1.amazonaws.com/001+(3).png',
        requiredCount: requiredCount,
        currentCount: currentCount,
      ),
      timestamp: DateTime.now(),
    );
  });

  /// Mock recent gifts với pagination
  static ApiResponse<PaginatedData<GiftTransactionModel>> getRecentGifts({
    required String userId,
    int page = 1,
    int limit = 20,
  }) {
    // Pagination logic
    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;
    final paginatedGifts = mockRecentGifts.sublist(
      startIndex,
      endIndex > mockRecentGifts.length ? mockRecentGifts.length : endIndex,
    );

    final meta = PaginationMeta(
      itemCount: paginatedGifts.length,
      totalItems: mockRecentGifts.length,
      itemsPerPage: limit,
      totalPages: (mockRecentGifts.length / limit).ceil(),
      currentPage: page,
    );

    return ApiResponse<PaginatedData<GiftTransactionModel>>(
      error: false,
      code: 0,
      message: 'Success',
      data: PaginatedData<GiftTransactionModel>(
        items: paginatedGifts,
        meta: meta,
      ),
      traceId: 'VIHOLaKaWe',
    );
  }

  /// Mock error response
  static ApiResponse<PaginatedData<GiftTransactionModel>> getErrorResponse({
    int code = 40001,
    String message = 'Error',
  }) {
    return ApiResponse<PaginatedData<GiftTransactionModel>>(
      error: true,
      code: code,
      message: message,
      data: PaginatedData<GiftTransactionModel>(
        items: [],
        meta: const PaginationMeta(
          itemCount: 0,
          totalItems: 0,
          itemsPerPage: 0,
          totalPages: 0,
          currentPage: 0,
        ),
      ),
      traceId: 'ERROR_${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}

