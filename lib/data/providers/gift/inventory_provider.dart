import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/services/gift_service.dart';

/// Provider để quản lý inventory của user hiện tại (me)
final myInventoryProvider = AsyncNotifierProvider<MyInventoryNotifier, List<GiftModel>>(
  MyInventoryNotifier.new,
);

/// Notifier xử lý inventory cho user hiện tại
class MyInventoryNotifier extends BasePaginatedNotifier<GiftModel>
    with ListItemUpdateMixin<GiftModel> {
  late final GiftService _service;

  @override
  Future<List<GiftModel>> build() async {
    _service = ref.read(giftServiceProvider);
    print('MyInventoryNotifier.build: loading my inventory');
    return super.build();
  }

  @override
  Future<PaginatedResponse<GiftModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    print('MyInventoryNotifier.fetchPage: page=$page, limit=$limit');

    final apiResponse = await _service.getMyInventory(
      page: page,
      limit: limit,
    );

    print('Inventory apiResponse (provider): ${apiResponse?.message}');

    // Wrap bằng ApiPaginatedResponse chuẩn từ base class
    final inventoryResponse = ApiPaginatedResponse<GiftModel>(apiResponse!);

    // Log error nếu có
    if (inventoryResponse.hasError) {
      print('Get inventory error: ${inventoryResponse.errorMessage}');
    }

    return inventoryResponse;
  }

  /// Update item quantity after sending gift
  void updateItemQuantity(String itemId, int quantitySent) {
    updateItem(
      (item) => item.id == itemId,
      (item) {
        final newQuantity = item.quantity - quantitySent;
        if (newQuantity <= 0) {
          // Return null để remove item (will be filtered)
          return item.copyWith(quantity: 0);
        }
        return item.copyWith(quantity: newQuantity);
      },
    );

    // Remove items with quantity 0
    final currentList = state.value ?? [];
    final filteredList = currentList.where((item) => item.quantity > 0).toList();
    state = AsyncData(filteredList);
  }
}
