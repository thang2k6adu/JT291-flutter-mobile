// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSummaryModel _$UserSummaryModelFromJson(Map<String, dynamic> json) =>
    _UserSummaryModel(
      id: json['id'] as String?,
      username: json['username'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      gender: json['gender'] as String?,
      shortBio: json['short_bio'] as String?,
      isFollowing: json['is_following'] as bool?,
    );

Map<String, dynamic> _$UserSummaryModelToJson(_UserSummaryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'gender': instance.gender,
      'short_bio': instance.shortBio,
      'is_following': instance.isFollowing,
    };
