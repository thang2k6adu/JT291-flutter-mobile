import 'package:freezed_annotation/freezed_annotation.dart';

part 'monthly_card_model.freezed.dart';
part 'monthly_card_model.g.dart';

@freezed
abstract class MonthlyCardModel with _$MonthlyCardModel {
  const factory MonthlyCardModel({
    required int cardId,
    required int price,
    required int diamondsDaily,
  }) = _MonthlyCardModel;

  factory MonthlyCardModel.fromJson(Map<String, dynamic> json) =>
      _$MonthlyCardModelFromJson(json);
}
