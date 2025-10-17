// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  isDeleted: json['is_deleted'] as bool? ?? false,
  unionId: json['union_id'] as String,
  isBlocked: json['is_blocked'] as bool? ?? false,
  nickname: json['nickname'],
  gender: json['gender'] as String?,
  bio: json['bio'] as String?,
  dateOfBirth: json['date_of_birth'] == null
      ? null
      : DateTime.parse(json['date_of_birth'] as String),
  profileUrls:
      (json['profile_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  avatarUrl: json['avatar_url'] as String?,
  level: json['level'] == null
      ? null
      : UserLevelModel.fromJson(json['level'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'is_deleted': instance.isDeleted,
      'union_id': instance.unionId,
      'is_blocked': instance.isBlocked,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'bio': instance.bio,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'profile_urls': instance.profileUrls,
      'avatar_url': instance.avatarUrl,
      'level': instance.level,
    };
