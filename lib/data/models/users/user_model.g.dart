// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  unionId: json['union_id'] as String?,
  nickname: json['nickname'] as String,
  avatar: json['avatar'] as String? ?? '',
  bio: json['bio'] as String?,
  gender: json['gender'] as String?,
  birthday: json['birthday'] == null
      ? null
      : DateTime.parse(json['birthday'] as String),
  profileUrls:
      (json['profile_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  interests:
      (json['interests'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  followingCount: (json['following_count'] as num?)?.toInt(),
  followersCount: (json['followers_count'] as num?)?.toInt(),
  viewsCount: (json['views_count'] as num?)?.toInt(),
  isFollowing: json['is_following'] as bool? ?? false,
  followStatus: json['follow_status'] as String? ?? 'not_following',
  mutualFollowersCount: (json['mutual_followers_count'] as num?)?.toInt() ?? 0,
  role: json['role'] as String? ?? 'user',
  isDeleted: json['is_deleted'] as bool? ?? false,
  isBlocked: json['is_blocked'] as bool? ?? false,
  isPending: json['isPending'] as bool? ?? false,
  level: json['level'] == null
      ? null
      : UserLevelModel.fromJson(json['level'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'union_id': instance.unionId,
      'nickname': instance.nickname,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'gender': instance.gender,
      'birthday': instance.birthday?.toIso8601String(),
      'profile_urls': instance.profileUrls,
      'interests': instance.interests,
      'following_count': instance.followingCount,
      'followers_count': instance.followersCount,
      'views_count': instance.viewsCount,
      'is_following': instance.isFollowing,
      'follow_status': instance.followStatus,
      'mutual_followers_count': instance.mutualFollowersCount,
      'role': instance.role,
      'is_deleted': instance.isDeleted,
      'is_blocked': instance.isBlocked,
      'isPending': instance.isPending,
      'level': instance.level,
    };
