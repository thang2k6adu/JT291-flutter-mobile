import 'package:freezed_annotation/freezed_annotation.dart';

part 'diamond_balance_model.freezed.dart';
part 'diamond_balance_model.g.dart';

@freezed
abstract class DiamondBalanceModel with _$DiamondBalanceModel {
  const factory DiamondBalanceModel({
    @JsonKey(name: 'diamond_balance') required double diamondBalance,
  }) = _DiamondBalanceModel;

  factory DiamondBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$DiamondBalanceModelFromJson(json);
}