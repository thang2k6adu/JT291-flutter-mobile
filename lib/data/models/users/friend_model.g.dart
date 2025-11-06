// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendModel _$FriendModelFromJson(Map<String, dynamic> json) => _FriendModel(
  friendId: json['friend_id'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FriendModelToJson(_FriendModel instance) =>
    <String, dynamic>{
      'friend_id': instance.friendId,
      'created_at': instance.createdAt?.toIso8601String(),
      'user': instance.user,
    };
