// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletSummaryModel _$WalletSummaryModelFromJson(Map<String, dynamic> json) =>
    _WalletSummaryModel(
      totalDiamondBalance: (json['totalDiamondBalance'] as num).toInt(),
      vexBalance: (json['vexBalance'] as num).toInt(),
      monthlyCardStatus: json['monthlyCardStatus'] as String,
    );

Map<String, dynamic> _$WalletSummaryModelToJson(_WalletSummaryModel instance) =>
    <String, dynamic>{
      'totalDiamondBalance': instance.totalDiamondBalance,
      'vexBalance': instance.vexBalance,
      'monthlyCardStatus': instance.monthlyCardStatus,
    };
