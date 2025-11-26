import 'package:freezed_annotation/freezed_annotation.dart';

part 'hot_topic_model.freezed.dart';
part 'hot_topic_model.g.dart';

/// Hot topic model for trending hashtags
@freezed
abstract class HotTopicModel with _$HotTopicModel {
  const factory HotTopicModel({
    required String id,
    required String hashtag,
    @JsonKey(name: 'post_count') @Default(0) int postCount,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    @JsonKey(name: 'engagement_score') @Default(0.0) double engagementScore,
  }) = _HotTopicModel;

  factory HotTopicModel.fromJson(Map<String, dynamic> json) =>
      _$HotTopicModelFromJson(json);
}







