// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_general.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserGeneralModel _$UserGeneralModelFromJson(Map<String, dynamic> json) =>
    _UserGeneralModel(
      id: json['id'] as String?,
      gender: json['gender'] as String?,
      nickname: json['nickname'] as String?,
      bio: json['bio'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      avatarUrl: json['avatar_url'] as String?,
      profileUrls: (json['profile_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserGeneralModelToJson(_UserGeneralModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'nickname': instance.nickname,
      'bio': instance.bio,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'avatar_url': instance.avatarUrl,
      'profile_urls': instance.profileUrls,
      'interests': instance.interests,
    };
