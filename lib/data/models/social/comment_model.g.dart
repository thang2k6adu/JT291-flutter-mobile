// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      id: json['id'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      media:
          (json['media'] as List<dynamic>?)
              ?.map((e) => PostMediaModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      likeCount: (json['like_count'] as num?)?.toInt() ?? 0,
      replyCount: (json['reply_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      parentCommentId: json['parent_comment_id'] as String?,
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'content': instance.content,
      'media': instance.media,
      'like_count': instance.likeCount,
      'reply_count': instance.replyCount,
      'is_liked': instance.isLiked,
      'created_at': instance.createdAt.toIso8601String(),
      'parent_comment_id': instance.parentCommentId,
    };
