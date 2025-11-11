// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  uid: json['uid'] as String?,
  unionId: json['union_id'] as String?,
  nickname: json['nickname'] as String,
  username: json['username'] as String?,
  avatarUrl: json['avatar_url'] as String? ?? '',
  bio: json['bio'] as String?,
  shortBio: json['short_bio'] as String? ?? '',
  gender: json['gender'] as String?,
  dateOfBirth: json['date_of_birth'] == null
      ? null
      : DateTime.parse(json['date_of_birth'] as String),
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
  verified: json['verified'] as bool? ?? false,
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
      'uid': instance.uid,
      'union_id': instance.unionId,
      'nickname': instance.nickname,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'bio': instance.bio,
      'short_bio': instance.shortBio,
      'gender': instance.gender,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'profile_urls': instance.profileUrls,
      'interests': instance.interests,
      'following_count': instance.followingCount,
      'followers_count': instance.followersCount,
      'views_count': instance.viewsCount,
      'is_following': instance.isFollowing,
      'follow_status': instance.followStatus,
      'mutual_followers_count': instance.mutualFollowersCount,
      'verified': instance.verified,
      'is_deleted': instance.isDeleted,
      'is_blocked': instance.isBlocked,
      'isPending': instance.isPending,
      'level': instance.level,
    };
