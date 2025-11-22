import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_transaction_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';

/// Mock data cho gift transactions (lịch sử quà tặng gần đây)
class GiftTransactionMock {
  /// Mock danh sách gift transactions
  static final List<GiftTransactionModel> _recentGifts = [
    GiftTransactionModel(
      id: 'tx12345',
      sender: const UserModel(
        id: '101',
        unionId: '101',
        nickname: 'Malenna Calzoni',
        avatar: '/avatars/malenna.jpg',
      ),
      giftInfo: const GiftModel(
        id: '101',
        name: 'Quà x1',
        imageUrl: '/images/gift_icon_a.png',
        quantity: 1,
      ),
      timestamp: DateTime.parse('2025-11-07T18:00:00Z'),
    ),
    GiftTransactionModel(
      id: 'tx12346',
      sender: const UserModel(
        id: '102',
        unionId: '102',
        nickname: 'John Doe',
        avatar: '/avatars/john.jpg',
      ),
      giftInfo: const GiftModel(
        id: '101',
        name: 'Quà x2',
        imageUrl: '/images/gift_icon_b.png',
        quantity: 2,
      ),
      timestamp: DateTime.parse('2025-11-06T15:30:00Z'),
    ),
    GiftTransactionModel(
      id: 'tx12347',
      sender: const UserModel(
        id: '103',
        unionId: '103',
        nickname: 'Alice Wang',
        avatar: '/avatars/alice.jpg',
      ),
      giftInfo: const GiftModel(
        id: '102',
        name: 'Hoa hồng',
        imageUrl: '/images/gift_icon_c.png',
        quantity: 5,
      ),
      timestamp: DateTime.parse('2025-11-05T12:20:00Z'),
    ),
    GiftTransactionModel(
      id: 'tx12348',
      sender: const UserModel(
        id: '104',
        unionId: '104',
        nickname: 'Bob Smith',
        avatar: '/avatars/bob.jpg',
      ),
      giftInfo: const GiftModel(
        id: '103',
        name: 'Chocolate',
        imageUrl: '/images/gift_icon_d.png',
        quantity: 10,
      ),
      timestamp: DateTime.parse('2025-11-04T09:15:00Z'),
    ),
    GiftTransactionModel(
      id: 'tx12349',
      sender: const UserModel(
        id: '105',
        unionId: '105',
        nickname: 'Charlie Brown',
        avatar: '/avatars/charlie.jpg',
      ),
      giftInfo: const GiftModel(
        id: '104',
        name: 'Teddy Bear',
        imageUrl: '/images/gift_icon_e.png',
        quantity: 1,
      ),
      timestamp: DateTime.parse('2025-11-03T16:45:00Z'),
    ),
  ];

  /// Mock recent gifts với pagination
  static ApiResponse<PaginatedData<GiftTransactionModel>> getRecentGifts({
    required String userId,
    int page = 1,
    int limit = 20,
  }) {
    // Pagination logic
    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;
    final paginatedGifts = _recentGifts.sublist(
      startIndex,
      endIndex > _recentGifts.length ? _recentGifts.length : endIndex,
    );

    final meta = PaginationMeta(
      itemCount: paginatedGifts.length,
      totalItems: _recentGifts.length,
      itemsPerPage: limit,
      totalPages: (_recentGifts.length / limit).ceil(),
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

