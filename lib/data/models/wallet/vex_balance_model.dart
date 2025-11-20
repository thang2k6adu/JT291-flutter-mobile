import 'package:freezed_annotation/freezed_annotation.dart';

part 'vex_balance_model.freezed.dart';
part 'vex_balance_model.g.dart';

@freezed
abstract class VexBalanceModel with _$VexBalanceModel {
  const factory VexBalanceModel({
    @JsonKey(name: 'vex_balance') required double vexBalance,
    @JsonKey(name: 'vex_balance_usd') required double vexBalanceUsd,
    @JsonKey(name: 'exchange_rate') required ExchangeRate exchangeRate,
    @JsonKey(name: 'daily_limits') required DailyLimits dailyLimits,
  }) = _VexBalanceModel;

  factory VexBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$VexBalanceModelFromJson(json);
}

@freezed
abstract class ExchangeRate with _$ExchangeRate {
  const factory ExchangeRate({
    @JsonKey(name: 'vex_to_usd') required double vexToUsd,
    @JsonKey(name: 'last_updated') required DateTime lastUpdated,
  }) = _ExchangeRate;

  factory ExchangeRate.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRateFromJson(json);
}

@freezed
abstract class DailyLimits with _$DailyLimits {
  const factory DailyLimits({
    @JsonKey(name: 'deposit_remaining') required double depositRemaining,
    @JsonKey(name: 'withdraw_remaining') required double withdrawRemaining,
    @JsonKey(name: 'transfer_remaining') required double transferRemaining,
  }) = _DailyLimits;

  factory DailyLimits.fromJson(Map<String, dynamic> json) =>
      _$DailyLimitsFromJson(json);
}
