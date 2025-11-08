// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) =>
    _TransactionItem(
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      icon: json['icon'] as String?,
      value: (json['value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionItemToJson(_TransactionItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
      'icon': instance.icon,
      'value': instance.value,
    };

_RelatedUser _$RelatedUserFromJson(Map<String, dynamic> json) => _RelatedUser(
  id: json['id'] as String,
  username: json['username'] as String,
  displayName: json['displayName'] as String,
  avatar: json['avatar'] as String,
  isVerified: json['isVerified'] as bool?,
);

Map<String, dynamic> _$RelatedUserToJson(_RelatedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'displayName': instance.displayName,
      'avatar': instance.avatar,
      'isVerified': instance.isVerified,
    };

_ExchangeDetails _$ExchangeDetailsFromJson(Map<String, dynamic> json) =>
    _ExchangeDetails(
      fromCurrency: $enumDecode(_$CurrencyTypeEnumMap, json['fromCurrency']),
      fromAmount: (json['fromAmount'] as num).toDouble(),
      toCurrency: $enumDecode(_$CurrencyTypeEnumMap, json['toCurrency']),
      toAmount: (json['toAmount'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$ExchangeDetailsToJson(_ExchangeDetails instance) =>
    <String, dynamic>{
      'fromCurrency': _$CurrencyTypeEnumMap[instance.fromCurrency]!,
      'fromAmount': instance.fromAmount,
      'toCurrency': _$CurrencyTypeEnumMap[instance.toCurrency]!,
      'toAmount': instance.toAmount,
      'rate': instance.rate,
    };

const _$CurrencyTypeEnumMap = {
  CurrencyType.diamonds: 'Diamonds',
  CurrencyType.vex: 'VEX',
};

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      id: json['id'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      balanceAfter: (json['balanceAfter'] as num?)?.toDouble(),
      timestamp: json['timestamp'] as String,
      description: json['description'] as String,
      item: json['item'] == null
          ? null
          : TransactionItem.fromJson(json['item'] as Map<String, dynamic>),
      relatedUser: json['relatedUser'] == null
          ? null
          : RelatedUser.fromJson(json['relatedUser'] as Map<String, dynamic>),
      exchange: json['exchange'] == null
          ? null
          : ExchangeDetails.fromJson(json['exchange'] as Map<String, dynamic>),
      status: $enumDecode(_$TransactionStatusEnumMap, json['status']),
      note: json['note'] as String?,
      referenceCode: json['referenceCode'] as String?,
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'balanceAfter': instance.balanceAfter,
      'timestamp': instance.timestamp,
      'description': instance.description,
      'item': instance.item,
      'relatedUser': instance.relatedUser,
      'exchange': instance.exchange,
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'note': instance.note,
      'referenceCode': instance.referenceCode,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.deposit: 'deposit',
  TransactionType.withdrawal: 'withdrawal',
  TransactionType.exchange: 'exchange',
  TransactionType.giftSent: 'gift_sent',
  TransactionType.giftReceived: 'gift_received',
  TransactionType.refund: 'refund',
  TransactionType.reward: 'reward',
};

const _$TransactionStatusEnumMap = {
  TransactionStatus.completed: 'completed',
  TransactionStatus.pending: 'pending',
  TransactionStatus.failed: 'failed',
  TransactionStatus.cancelled: 'cancelled',
};

_TransactionHistoryResponse _$TransactionHistoryResponseFromJson(
  Map<String, dynamic> json,
) => _TransactionHistoryResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: PaginationModel.fromJson(
    json['pagination'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TransactionHistoryResponseToJson(
  _TransactionHistoryResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};
