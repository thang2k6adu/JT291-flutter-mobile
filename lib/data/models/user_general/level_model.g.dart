// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LevelModel _$LevelModelFromJson(Map<String, dynamic> json) => _LevelModel(
  id: json['id'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  isDeleted: json['is_deleted'] as bool?,
  currentLevel: (json['current_level'] as num?)?.toInt(),
  currentExp: (json['current_exp'] as num?)?.toInt(),
  totalExp: (json['total_exp'] as num?)?.toInt(),
  nextLevelExp: (json['next_level_exp'] as num?)?.toInt(),
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$LevelModelToJson(_LevelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'is_deleted': instance.isDeleted,
      'current_level': instance.currentLevel,
      'current_exp': instance.currentExp,
      'total_exp': instance.totalExp,
      'next_level_exp': instance.nextLevelExp,
      'user_id': instance.userId,
    };
