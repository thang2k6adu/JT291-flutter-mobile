import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_stream_model.freezed.dart';
part 'token_stream_model.g.dart';

@freezed
abstract class TokenStreamModel with _$TokenStreamModel {
  const factory TokenStreamModel({
    required String chatToken,
    @Default('') String feedToken,
    @Default('') String apiKey,
    @Default('') String appId,
  }) = _TokenStreamModel;

  factory TokenStreamModel.fromJson(Map<String, Object?> json) =>
      _$TokenStreamModelFromJson(json);

  factory TokenStreamModel.empty() => const TokenStreamModel(
    chatToken: '',
    feedToken: '',
    apiKey: '',
    appId: '',
  );
}
