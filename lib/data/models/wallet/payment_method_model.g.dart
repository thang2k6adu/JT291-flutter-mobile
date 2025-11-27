// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMethodModel _$PaymentMethodModelFromJson(Map<String, dynamic> json) =>
    _PaymentMethodModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      maskedInfo: json['maskedInfo'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$PaymentMethodModelToJson(_PaymentMethodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'maskedInfo': instance.maskedInfo,
      'isActive': instance.isActive,
    };
