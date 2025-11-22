// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GiftModel _$GiftModelFromJson(Map<String, dynamic> json) => _GiftModel(
  id: json['id'] as String,
  itemId: json['item_id'] as String?,
  name: json['name'] as String,
  imageUrl: json['image_url'] as String,
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  type: json['type'] as String? ?? 'normal',
  isEvent: json['is_event'] as bool? ?? false,
  eventEndDate: json['event_end_date'] == null
      ? null
      : DateTime.parse(json['event_end_date'] as String),
  description: json['description'] as String?,
  category: json['category'] as String?,
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  requiredCount: (json['required_count'] as num?)?.toInt() ?? 0,
  currentCount: (json['current_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$GiftModelToJson(_GiftModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_id': instance.itemId,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'type': instance.type,
      'is_event': instance.isEvent,
      'event_end_date': instance.eventEndDate?.toIso8601String(),
      'description': instance.description,
      'category': instance.category,
      'quantity': instance.quantity,
      'required_count': instance.requiredCount,
      'current_count': instance.currentCount,
    };
