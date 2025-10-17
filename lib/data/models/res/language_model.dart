import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
abstract class LanguageModel with _$LanguageModel {
  const factory LanguageModel({
    required String code,
    required String name,
    @JsonKey(name: 'name_native') String? nameNative,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, Object?> json) =>
      _$LanguageModelFromJson(json);
}
