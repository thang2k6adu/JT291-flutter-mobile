// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      id: json['id'] as String,
      postId: json['post_id'] as String,
      userId: json['user_id'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      media: json['media'] == null
          ? const []
          : _mediaFromJson(json['media'] as List),
      likeCount: (json['like_count'] as num?)?.toInt() ?? 0,
      repliesCount: (json['replies_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      parentId: json['parent_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'user': instance.user,
      'content': instance.content,
      'media': _mediaToJson(instance.media),
      'like_count': instance.likeCount,
      'replies_count': instance.repliesCount,
      'is_liked': instance.isLiked,
      'parent_id': instance.parentId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
