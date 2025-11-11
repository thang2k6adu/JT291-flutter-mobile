// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSummaryModel _$UserSummaryModelFromJson(Map<String, dynamic> json) =>
    _UserSummaryModel(
      id: json['id'] as String?,
      uid: json['uid'] as String?,
      username: json['username'] as String?,
      nickname: json['nickname'] as String?,
      avatarUrl: json['avatar_url'] as String? ?? '',
      bio: json['bio'] as String?,
      gender: json['gender'] as String?,
      shortBio: json['short_bio'] as String? ?? '',
      isFollowing: json['is_following'] as bool? ?? false,
      followStatus: json['follow_status'] as String? ?? 'not_following',
      verified: json['verified'] as bool? ?? false,
      mutualFollowersCount:
          (json['mutual_followers_count'] as num?)?.toInt() ?? 0,
      isPending: json['isPending'] as bool? ?? false,
    );

Map<String, dynamic> _$UserSummaryModelToJson(_UserSummaryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'username': instance.username,
      'nickname': instance.nickname,
      'avatar_url': instance.avatarUrl,
      'bio': instance.bio,
      'gender': instance.gender,
      'short_bio': instance.shortBio,
      'is_following': instance.isFollowing,
      'follow_status': instance.followStatus,
      'verified': instance.verified,
      'mutual_followers_count': instance.mutualFollowersCount,
      'isPending': instance.isPending,
    };
