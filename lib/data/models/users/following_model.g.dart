// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowingModel _$FollowingModelFromJson(Map<String, dynamic> json) =>
    _FollowingModel(
      followingId: json['following_id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isMutual: json['is_mutual'] as bool?,
      isFriend: json['is_friend'] as bool?,
      isBlocked: json['is_blocked'] as bool?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowingModelToJson(_FollowingModel instance) =>
    <String, dynamic>{
      'following_id': instance.followingId,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_mutual': instance.isMutual,
      'is_friend': instance.isFriend,
      'is_blocked': instance.isBlocked,
      'user': instance.user,
    };
