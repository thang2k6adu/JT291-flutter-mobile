import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_media_model.freezed.dart';
part 'post_media_model.g.dart';

/// Media type enum
enum MediaType {
  @JsonValue('image')
  image,
  @JsonValue('video')
  video,
  @JsonValue('audio')
  audio,
}

/// Post media model
@freezed
abstract class PostMediaModel with _$PostMediaModel {
  const factory PostMediaModel({
    required String id,
    required MediaType type,
    required String url,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    int? width,
    int? height,
    int? duration, // for video/audio in seconds
  }) = _PostMediaModel;

  factory PostMediaModel.fromJson(Map<String, dynamic> json) =>
      _$PostMediaModelFromJson(json);
}


