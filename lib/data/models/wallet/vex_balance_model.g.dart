// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vex_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VexBalanceModel _$VexBalanceModelFromJson(Map<String, dynamic> json) =>
    _VexBalanceModel(
      vexBalance: (json['vex_balance'] as num).toDouble(),
      vexBalanceUsd: (json['vex_balance_usd'] as num).toDouble(),
      exchangeRate: ExchangeRate.fromJson(
        json['exchange_rate'] as Map<String, dynamic>,
      ),
      dailyLimits: DailyLimits.fromJson(
        json['daily_limits'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$VexBalanceModelToJson(_VexBalanceModel instance) =>
    <String, dynamic>{
      'vex_balance': instance.vexBalance,
      'vex_balance_usd': instance.vexBalanceUsd,
      'exchange_rate': instance.exchangeRate,
      'daily_limits': instance.dailyLimits,
    };

_ExchangeRate _$ExchangeRateFromJson(Map<String, dynamic> json) =>
    _ExchangeRate(
      vexToUsd: (json['vex_to_usd'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$ExchangeRateToJson(_ExchangeRate instance) =>
    <String, dynamic>{
      'vex_to_usd': instance.vexToUsd,
      'last_updated': instance.lastUpdated.toIso8601String(),
    };

_DailyLimits _$DailyLimitsFromJson(Map<String, dynamic> json) => _DailyLimits(
  depositRemaining: (json['deposit_remaining'] as num).toDouble(),
  withdrawRemaining: (json['withdraw_remaining'] as num).toDouble(),
  transferRemaining: (json['transfer_remaining'] as num).toDouble(),
);

Map<String, dynamic> _$DailyLimitsToJson(_DailyLimits instance) =>
    <String, dynamic>{
      'deposit_remaining': instance.depositRemaining,
      'withdraw_remaining': instance.withdrawRemaining,
      'transfer_remaining': instance.transferRemaining,
    };
