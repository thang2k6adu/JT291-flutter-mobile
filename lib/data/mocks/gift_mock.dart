import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_list_response.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';

/// Mock data cho gifts catalog
class GiftMock {
  /// Mock danh sách gifts theo category
  static ApiResponse<GiftListResponse> getGiftList({
    String category = 'all',
    int page = 1,
    int limit = 20,
  }) {
    final gifts = _getGiftsByCategory(category);
    
    // Pagination logic
    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;
    final paginatedGifts = gifts.sublist(
      startIndex,
      endIndex > gifts.length ? gifts.length : endIndex,
    );

    return ApiResponse<GiftListResponse>(
      error: false,
      code: 0,
      message: 'Success',
      data: GiftListResponse(
        items: paginatedGifts,
        meta: PaginationMeta(
          itemCount: paginatedGifts.length,
          totalItems: gifts.length,
          itemsPerPage: limit,
          totalPages: (gifts.length / limit).ceil(),
          currentPage: page,
        ),
      ),
      traceId: 'GIFT_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  /// Lấy gifts theo category
  static List<GiftModel> _getGiftsByCategory(String category) {
    switch (category.toLowerCase()) {
      case 'hot':
        return _hotGifts;
      case 'event':
        return _eventGifts;
      case 'lucky':
        return _luckyGifts;
      case 'friendship':
        return _friendshipGifts;
      case 'vip':
        return _vipGifts;
      case 'all':
      default:
        return [..._allGifts];
    }
  }

  /// All gifts
  static final List<GiftModel> _allGifts = [
    ..._hotGifts,
    ..._eventGifts,
    ..._luckyGifts,
    ..._friendshipGifts,
    ..._vipGifts,
  ];

  /// Hot gifts
  static final List<GiftModel> _hotGifts = [
    GiftModel(
      id: 1,
      name: 'Rose',
      imageUrl: 'https://cdn.example.com/gifts/rose.png',
      price: 10,
      type: 'normal',
      isEvent: false,
      category: 'hot',
      description: 'A beautiful red rose',
    ),
    GiftModel(
      id: 2,
      name: 'Chocolate Box',
      imageUrl: 'https://cdn.example.com/gifts/chocolate.png',
      price: 20,
      type: 'normal',
      isEvent: false,
      category: 'hot',
      description: 'Sweet chocolate box',
    ),
    GiftModel(
      id: 3,
      name: 'Teddy Bear',
      imageUrl: 'https://cdn.example.com/gifts/teddy.png',
      price: 50,
      type: 'normal',
      isEvent: false,
      category: 'hot',
      description: 'Cute teddy bear',
    ),
  ];

  /// Event gifts
  static final List<GiftModel> _eventGifts = [
    GiftModel(
      id: 101,
      name: 'Christmas Tree',
      imageUrl: 'https://cdn.example.com/gifts/xmas_tree.png',
      price: 100,
      type: 'normal',
      isEvent: true,
      eventEndDate: DateTime(2025, 12, 31, 23, 59, 59),
      category: 'event',
      description: 'Limited Christmas edition',
    ),
    GiftModel(
      id: 102,
      name: 'Fireworks',
      imageUrl: 'https://cdn.example.com/gifts/fireworks.png',
      price: 150,
      type: 'normal',
      isEvent: true,
      eventEndDate: DateTime(2025, 12, 31, 23, 59, 59),
      category: 'event',
      description: 'New Year special',
    ),
    GiftModel(
      id: 103,
      name: 'Santa Hat',
      imageUrl: 'https://cdn.example.com/gifts/santa_hat.png',
      price: 30,
      type: 'normal',
      isEvent: true,
      eventEndDate: DateTime(2025, 12, 31, 23, 59, 59),
      category: 'event',
      description: 'Holiday spirit',
    ),
  ];

  /// Lucky gifts
  static final List<GiftModel> _luckyGifts = [
    GiftModel(
      id: 201,
      name: 'Four Leaf Clover',
      imageUrl: 'https://cdn.example.com/gifts/clover.png',
      price: 40,
      type: 'normal',
      isEvent: false,
      category: 'lucky',
      description: 'Bring good luck',
    ),
    GiftModel(
      id: 202,
      name: 'Lucky Cat',
      imageUrl: 'https://cdn.example.com/gifts/lucky_cat.png',
      price: 60,
      type: 'normal',
      isEvent: false,
      category: 'lucky',
      description: 'Japanese fortune cat',
    ),
    GiftModel(
      id: 203,
      name: 'Horseshoe',
      imageUrl: 'https://cdn.example.com/gifts/horseshoe.png',
      price: 25,
      type: 'normal',
      isEvent: false,
      category: 'lucky',
      description: 'Symbol of good fortune',
    ),
  ];

  /// Friendship gifts
  static final List<GiftModel> _friendshipGifts = [
    GiftModel(
      id: 301,
      name: 'Friendship Bracelet',
      imageUrl: 'https://cdn.example.com/gifts/bracelet.png',
      price: 35,
      type: 'normal',
      isEvent: false,
      category: 'friendship',
      description: 'Best friends forever',
    ),
    GiftModel(
      id: 302,
      name: 'Heart Balloon',
      imageUrl: 'https://cdn.example.com/gifts/balloon.png',
      price: 15,
      type: 'normal',
      isEvent: false,
      category: 'friendship',
      description: 'Share the love',
    ),
    GiftModel(
      id: 303,
      name: 'Photo Frame',
      imageUrl: 'https://cdn.example.com/gifts/frame.png',
      price: 45,
      type: 'normal',
      isEvent: false,
      category: 'friendship',
      description: 'Capture memories',
    ),
  ];

  /// VIP gifts
  static final List<GiftModel> _vipGifts = [
    GiftModel(
      id: 401,
      name: 'Diamond Ring',
      imageUrl: 'https://cdn.example.com/gifts/diamond_ring.png',
      price: 1000,
      type: 'VIP',
      isEvent: false,
      category: 'vip',
      description: 'Luxury diamond ring',
    ),
    GiftModel(
      id: 402,
      name: 'Golden Crown',
      imageUrl: 'https://cdn.example.com/gifts/crown.png',
      price: 2000,
      type: 'VIP',
      isEvent: false,
      category: 'vip',
      description: 'Royal crown',
    ),
    GiftModel(
      id: 403,
      name: 'Luxury Car',
      imageUrl: 'https://cdn.example.com/gifts/car.png',
      price: 5000,
      type: 'VIP',
      isEvent: false,
      category: 'vip',
      description: 'Sports car',
    ),
    GiftModel(
      id: 404,
      name: 'Private Jet',
      imageUrl: 'https://cdn.example.com/gifts/jet.png',
      price: 10000,
      type: 'VIP',
      isEvent: false,
      category: 'vip',
      description: 'Ultimate luxury',
    ),
  ];

  /// Mock paginated gift list (using PaginatedData)
  static ApiResponse<PaginatedData<GiftModel>> getPaginatedGiftList({
    String category = 'all',
    int page = 1,
    int limit = 20,
  }) {
    final gifts = _getGiftsByCategory(category);
    
    // Pagination logic
    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;
    final paginatedGifts = gifts.sublist(
      startIndex,
      endIndex > gifts.length ? gifts.length : endIndex,
    );

    final meta = PaginationMeta(
      itemCount: paginatedGifts.length,
      totalItems: gifts.length,
      itemsPerPage: limit,
      totalPages: (gifts.length / limit).ceil(),
      currentPage: page,
    );

    return ApiResponse<PaginatedData<GiftModel>>(
      error: false,
      code: 0,
      message: 'Success',
      data: PaginatedData<GiftModel>(items: paginatedGifts, meta: meta),
      traceId: 'GIFT_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  /// Mock error response (with GiftListResponse)
  static ApiResponse<GiftListResponse> getErrorResponse({
    int code = 40001,
    String message = 'Invalid category',
  }) {
    return ApiResponse<GiftListResponse>(
      error: true,
      code: code,
      message: message,
      data: null,
      traceId: 'ERROR_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  /// Mock error response (with PaginatedData)
  static ApiResponse<PaginatedData<GiftModel>> getPaginatedErrorResponse({
    int code = 40001,
    String message = 'Invalid category',
  }) {
    return ApiResponse<PaginatedData<GiftModel>>(
      error: true,
      code: code,
      message: message,
      data: null,
      traceId: 'ERROR_${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}

