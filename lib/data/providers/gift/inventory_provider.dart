import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/gift/inventory_item_model.dart';
import 'package:jt291_flutter_mobile/data/services/gift_service.dart';

/// Provider để quản lý inventory của user hiện tại (me)
final myInventoryProvider = AsyncNotifierProvider<MyInventoryNotifier, List<InventoryItemModel>>(
  MyInventoryNotifier.new,
);

/// Notifier xử lý inventory cho user hiện tại
class MyInventoryNotifier extends BasePaginatedNotifier<InventoryItemModel>
    with ListItemUpdateMixin<InventoryItemModel> {
  late final GiftService _service;

  @override
  Future<List<InventoryItemModel>> build() async {
    _service = ref.read(giftServiceProvider);
    print('MyInventoryNotifier.build: loading my inventory');
    return super.build();
  }

  @override
  Future<PaginatedResponse<InventoryItemModel>> fetchPage({
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
    final inventoryResponse = ApiPaginatedResponse<InventoryItemModel>(apiResponse!);

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
