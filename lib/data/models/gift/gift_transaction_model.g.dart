// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GiftTransactionModel _$GiftTransactionModelFromJson(
  Map<String, dynamic> json,
) => _GiftTransactionModel(
  id: json['transaction_id'] as String,
  sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
  giftInfo: GiftModel.fromJson(json['gift_info'] as Map<String, dynamic>),
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$GiftTransactionModelToJson(
  _GiftTransactionModel instance,
) => <String, dynamic>{
  'transaction_id': instance.id,
  'sender': instance.sender,
  'gift_info': instance.giftInfo,
  'timestamp': instance.timestamp.toIso8601String(),
};
