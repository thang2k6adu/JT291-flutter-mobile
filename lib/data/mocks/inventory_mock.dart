import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/gift/inventory_item_model.dart';

/// Mock data for user inventory
class InventoryMock {
  /// Get inventory for current user (me)
  static ApiResponse<PaginatedData<InventoryItemModel>> getMyInventory({
    int page = 1,
    int limit = 20,
  }) {
    final inventory = _myInventory;

    // Pagination logic
    final startIndex = (page - 1) * limit;
    final endIndex = startIndex + limit;
    final paginatedItems = inventory.sublist(
      startIndex,
      endIndex > inventory.length ? inventory.length : endIndex,
    );

    final meta = PaginationMeta(
      itemCount: paginatedItems.length,
      totalItems: inventory.length,
      itemsPerPage: limit,
      totalPages: (inventory.length / limit).ceil(),
      currentPage: page,
    );

    return ApiResponse<PaginatedData<InventoryItemModel>>(
      error: false,
      code: 0,
      message: 'Success',
      data: PaginatedData<InventoryItemModel>(items: paginatedItems, meta: meta),
      traceId: 'INVENTORY_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  /// Mock error response
  static ApiResponse<PaginatedData<InventoryItemModel>> getErrorResponse({
    int code = 40001,
    String message = 'User not found',
  }) {
    return ApiResponse<PaginatedData<InventoryItemModel>>(
      error: true,
      code: code,
      message: message,
      data: PaginatedData<InventoryItemModel>(
        items: [],
        meta: PaginationMeta(
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

  /// My inventory (current user)
  static final List<InventoryItemModel> _myInventory = [
    // InventoryItemModel(
    //   id: 1,
    //   name: 'Rose',
    //   imageUrl: 'https://ecommerce-gk-bucket.s3.ap-southeast-1.amazonaws.com/001+(1).png',
    //   price: 10,
    //   type: 'normal',
    //   quantity: 3,
    //   isEvent: false,
    //   category: 'hot',
    //   description: 'A beautiful red rose',
    // ),
    // InventoryItemModel(
    //   id: 2,
    //   name: 'Chocolate Box',
    //   imageUrl: 'https://ecommerce-gk-bucket.s3.ap-southeast-1.amazonaws.com/001+(1).png',
    //   price: 20,
    //   type: 'normal',
    //   quantity: 5,
    //   isEvent: false,
    //   category: 'hot',
    //   description: 'Sweet chocolate box',
    // ),
    // InventoryItemModel(
    //   id: 101,
    //   name: 'Christmas Tree',
    //   imageUrl: 'https://ecommerce-gk-bucket.s3.ap-southeast-1.amazonaws.com/001+(1).png',
    //   price: 100,
    //   type: 'normal',
    //   quantity: 2,
    //   isEvent: true,
    //   eventEndDate: DateTime(2025, 12, 31, 23, 59, 59),
    //   category: 'event',
    //   description: 'Limited Christmas edition',
    // ),
    // InventoryItemModel(
    //   id: 102,
    //   name: 'Diamond',
    //   imageUrl: 'https://ecommerce-gk-bucket.s3.ap-southeast-1.amazonaws.com/001+(1).png',
    //   price: 100,
    //   type: 'vip',
    //   quantity: 3,
    //   isEvent: true,
    //   eventEndDate: DateTime(2025, 12, 31, 23, 59, 59),
    //   category: 'vip',
    //   description: 'Precious diamond',
    // ),
    // InventoryItemModel(
    //   id: 201,
    //   name: 'Four Leaf Clover',
    //   imageUrl: 'https://ecommerce-gk-bucket.s3.ap-southeast-1.amazonaws.com/001+(1).png',
    //   price: 40,
    //   type: 'normal',
    //   quantity: 1,
    //   isEvent: false,
    //   category: 'lucky',
    //   description: 'Bring good luck',
    // ),
    // InventoryItemModel(
    //   id: 401,
    //   name: 'Diamond Ring',
    //   imageUrl: 'https://ecommerce-gk-bucket.s3.ap-southeast-1.amazonaws.com/001+(1).png',
    //   price: 1000,
    //   type: 'VIP',
    //   quantity: 1,
    //   isEvent: false,
    //   category: 'vip',
    //   description: 'Luxury diamond ring',
    // ),
  ];

  /// Mock send gift response
  static ApiResponse<Map<String, dynamic>> sendGiftSuccess({
    required int recipientId,
    required int itemId,
    required int quantity,
  }) {
    return ApiResponse<Map<String, dynamic>>(
      error: false,
      code: 0,
      message: 'Gift sent successfully',
      data: {
        'recipient_id': recipientId,
        'item_id': itemId,
        'quantity': quantity,
        'sent_at': DateTime.now().toIso8601String(),
      },
      traceId: 'SEND_GIFT_${DateTime.now().millisecondsSinceEpoch}',
    );
  }

  /// Mock send gift error response
  static ApiResponse<Map<String, dynamic>> sendGiftError({
    int code = 40003,
    String message = 'Insufficient quantity',
  }) {
    return ApiResponse<Map<String, dynamic>>(
      error: true,
      code: code,
      message: message,
      data: null,
      traceId: 'ERROR_${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}

