// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_relationship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRelationshipModel _$UserRelationshipModelFromJson(
  Map<String, dynamic> json,
) => _UserRelationshipModel(
  isFollowing: json['is_following'] as bool? ?? false,
  isFollower: json['is_follower'] as bool? ?? false,
  isFriend: json['is_friend'] as bool? ?? false,
  isMe: json['is_me'] as bool? ?? false,
  isBlocked: json['is_blocked'] as bool? ?? false,
);

Map<String, dynamic> _$UserRelationshipModelToJson(
  _UserRelationshipModel instance,
) => <String, dynamic>{
  'is_following': instance.isFollowing,
  'is_follower': instance.isFollower,
  'is_friend': instance.isFriend,
  'is_me': instance.isMe,
  'is_blocked': instance.isBlocked,
};
