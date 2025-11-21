// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InventoryItemModel _$InventoryItemModelFromJson(Map<String, dynamic> json) =>
    _InventoryItemModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      price: (json['price'] as num).toInt(),
      type: json['type'] as String? ?? 'normal',
      quantity: (json['quantity'] as num).toInt(),
      isEvent: json['is_event'] as bool? ?? false,
      eventEndDate: json['event_end_date'] == null
          ? null
          : DateTime.parse(json['event_end_date'] as String),
      description: json['description'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$InventoryItemModelToJson(_InventoryItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'type': instance.type,
      'quantity': instance.quantity,
      'is_event': instance.isEvent,
      'event_end_date': instance.eventEndDate?.toIso8601String(),
      'description': instance.description,
      'category': instance.category,
    };
