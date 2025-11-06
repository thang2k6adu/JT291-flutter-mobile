// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_general.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserGeneralModel _$UserGeneralModelFromJson(Map<String, dynamic> json) =>
    _UserGeneralModel(
      id: json['id'] as String?,
      isDeleted: json['is_deleted'] as bool?,
      unionId: json['union_id'] as String?,
      isBlocked: json['is_blocked'] as bool?,
      nickname: json['nickname'] as String?,
      gender: json['gender'] as String?,
      bio: json['bio'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      profileUrls: (json['profile_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      avatarUrl: json['avatar_url'] as String?,
      followingCount: (json['following_count'] as num?)?.toInt(),
      followersCount: (json['followers_count'] as num?)?.toInt(),
      viewsCount: (json['views_count'] as num?)?.toInt(),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      level: json['level'] == null
          ? null
          : LevelModel.fromJson(json['level'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserGeneralModelToJson(_UserGeneralModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_deleted': instance.isDeleted,
      'union_id': instance.unionId,
      'is_blocked': instance.isBlocked,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'bio': instance.bio,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'profile_urls': instance.profileUrls,
      'avatar_url': instance.avatarUrl,
      'following_count': instance.followingCount,
      'followers_count': instance.followersCount,
      'views_count': instance.viewsCount,
      'interests': instance.interests,
      'level': instance.level,
    };
