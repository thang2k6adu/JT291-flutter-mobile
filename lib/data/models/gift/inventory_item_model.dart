import 'package:freezed_annotation/freezed_annotation.dart';

part 'inventory_item_model.freezed.dart';
part 'inventory_item_model.g.dart';

/// Inventory item model - represents a gift in user's inventory
/// Extends gift data with quantity information
@freezed
abstract class InventoryItemModel with _$InventoryItemModel {
  const factory InventoryItemModel({
    required int id,
    required String name,
    @JsonKey(name: 'image_url') required String imageUrl,
    required int price,
    @Default('normal') String type,
    required int quantity,
    @JsonKey(name: 'is_event') @Default(false) bool isEvent,
    @JsonKey(name: 'event_end_date') DateTime? eventEndDate,
    String? description,
    String? category,
  }) = _InventoryItemModel;

  factory InventoryItemModel.fromJson(Map<String, Object?> json) =>
      _$InventoryItemModelFromJson(json);
}

