// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowerModel _$FollowerModelFromJson(Map<String, dynamic> json) =>
    _FollowerModel(
      followerId: json['follower_id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isFriend: json['is_friend'] as bool?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowerModelToJson(_FollowerModel instance) =>
    <String, dynamic>{
      'follower_id': instance.followerId,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_friend': instance.isFriend,
      'user': instance.user,
    };
