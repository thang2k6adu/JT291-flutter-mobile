// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HotTopicModel _$HotTopicModelFromJson(Map<String, dynamic> json) =>
    _HotTopicModel(
      id: json['id'] as String,
      hashtag: json['hashtag'] as String,
      postCount: (json['post_count'] as num?)?.toInt() ?? 0,
      thumbnailUrl: json['thumbnail_url'] as String?,
      engagementScore: (json['engagement_score'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$HotTopicModelToJson(_HotTopicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hashtag': instance.hashtag,
      'post_count': instance.postCount,
      'thumbnail_url': instance.thumbnailUrl,
      'engagement_score': instance.engagementScore,
    };
