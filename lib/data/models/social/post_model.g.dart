// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostModel _$PostModelFromJson(Map<String, dynamic> json) => _PostModel(
  id: json['id'] as String,
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  content: json['content'] as String,
  media: json['media'] == null
      ? const []
      : _mediaFromJson(json['media'] as List),
  hashtags:
      (json['hashtags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  likeCount: (json['like_count'] as num?)?.toInt() ?? 0,
  commentCount: (json['comment_count'] as num?)?.toInt() ?? 0,
  shareCount: (json['share_count'] as num?)?.toInt() ?? 0,
  isLiked: json['is_liked'] as bool? ?? false,
  isBookmarked: json['is_bookmarked'] as bool? ?? false,
  createdAt: DateTime.parse(json['created_at'] as String),
  privacy:
      $enumDecodeNullable(_$PostPrivacyEnumMap, json['privacy']) ??
      PostPrivacy.public,
  location: json['location'] as String?,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$PostModelToJson(_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'content': instance.content,
      'media': _mediaToJson(instance.media),
      'hashtags': instance.hashtags,
      'like_count': instance.likeCount,
      'comment_count': instance.commentCount,
      'share_count': instance.shareCount,
      'is_liked': instance.isLiked,
      'is_bookmarked': instance.isBookmarked,
      'created_at': instance.createdAt.toIso8601String(),
      'privacy': _$PostPrivacyEnumMap[instance.privacy]!,
      'location': instance.location,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$PostPrivacyEnumMap = {
  PostPrivacy.public: 'public',
  PostPrivacy.friends: 'friends',
  PostPrivacy.private: 'private',
};
