import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
abstract class TokenModel with _$TokenModel {
  const factory TokenModel({
    required String accessToken,
    required String refreshToken,
    @JsonKey(fromJson: _dateTimeFromJson, toJson: _dateTimeToJson)
    required DateTime? expiredAt,
  }) = _TokenModel;

  factory TokenModel.fromJson(Map<String, Object?> json) =>
      _$TokenModelFromJson(json);

  factory TokenModel.empty() =>
      const TokenModel(accessToken: '', refreshToken: '', expiredAt: null);
}

// JSON converter helpers
DateTime? _dateTimeFromJson(String? date) =>
    date == null ? null : DateTime.tryParse(date);

String? _dateTimeToJson(DateTime? date) => date?.toIso8601String();
