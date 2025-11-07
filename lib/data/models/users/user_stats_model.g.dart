// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserStatsModel _$UserStatsModelFromJson(Map<String, dynamic> json) =>
    _UserStatsModel(
      followingCount: (json['following_count'] as num?)?.toInt(),
      followersCount: (json['followers_count'] as num?)?.toInt(),
      friendsCount: (json['friends_count'] as num?)?.toInt(),
      isPending: json['isPending'] as bool? ?? false,
    );

Map<String, dynamic> _$UserStatsModelToJson(_UserStatsModel instance) =>
    <String, dynamic>{
      'following_count': instance.followingCount,
      'followers_count': instance.followersCount,
      'friends_count': instance.friendsCount,
      'isPending': instance.isPending,
    };
