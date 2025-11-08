// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MonthlyCardModel _$MonthlyCardModelFromJson(Map<String, dynamic> json) =>
    _MonthlyCardModel(
      cardId: (json['cardId'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      diamondsDaily: (json['diamondsDaily'] as num).toInt(),
    );

Map<String, dynamic> _$MonthlyCardModelToJson(_MonthlyCardModel instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'price': instance.price,
      'diamondsDaily': instance.diamondsDaily,
    };
