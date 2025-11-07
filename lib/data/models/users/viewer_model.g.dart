// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'viewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ViewerModel _$ViewerModelFromJson(Map<String, dynamic> json) => _ViewerModel(
  viewerId: json['viewerId'] as String,
  username: json['username'] as String,
  avatarUrl: json['avatarUrl'] as String,
  gender: json['gender'] as String,
  shortBio: json['shortBio'] as String,
  viewTime: DateTime.parse(json['viewTime'] as String),
);

Map<String, dynamic> _$ViewerModelToJson(_ViewerModel instance) =>
    <String, dynamic>{
      'viewerId': instance.viewerId,
      'username': instance.username,
      'avatarUrl': instance.avatarUrl,
      'gender': instance.gender,
      'shortBio': instance.shortBio,
      'viewTime': instance.viewTime.toIso8601String(),
    };
