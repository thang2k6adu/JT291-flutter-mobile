import 'package:freezed_annotation/freezed_annotation.dart';

part 'gift_model.freezed.dart';
part 'gift_model.g.dart';

/// Gift model for catalog items
@freezed
abstract class GiftModel with _$GiftModel {
  const factory GiftModel({
    required String id,
    required String name,
    @JsonKey(name: 'image_url') required String imageUrl,
    required double price,
    @Default('normal') String type,
    @JsonKey(name: 'is_event') @Default(false) bool isEvent,
    @JsonKey(name: 'event_end_date') DateTime? eventEndDate,
    String? description,
    String? category,
  }) = _GiftModel;

  factory GiftModel.fromJson(Map<String, Object?> json) =>
      _$GiftModelFromJson(json);
}

