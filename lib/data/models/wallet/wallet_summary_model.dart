import 'package:freezed_annotation/freezed_annotation.dart'; 

part 'wallet_summary_model.freezed.dart';
part 'wallet_summary_model.g.dart';

@freezed
abstract class WalletSummaryModel with _$WalletSummaryModel {
  const factory WalletSummaryModel({
    required int totalDiamondBalance,
    required int vexBalance,
    required String monthlyCardStatus, // active | expired | none
  }) = _WalletSummaryModel;

  factory WalletSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$WalletSummaryModelFromJson(json);
}
