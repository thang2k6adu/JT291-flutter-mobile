// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserLevelModel _$UserLevelModelFromJson(Map<String, dynamic> json) =>
    _UserLevelModel(
      currentLevel: (json['current_level'] as num?)?.toInt() ?? 0,
      currentExp: (json['current_exp'] as num?)?.toInt() ?? 0,
      totalExp: (json['total_exp'] as num?)?.toInt() ?? 0,
      nextLevelExp: (json['next_level_exp'] as num?)?.toInt() ?? 50,
      isPending: json['isPending'] as bool? ?? false,
    );

Map<String, dynamic> _$UserLevelModelToJson(_UserLevelModel instance) =>
    <String, dynamic>{
      'current_level': instance.currentLevel,
      'current_exp': instance.currentExp,
      'total_exp': instance.totalExp,
      'next_level_exp': instance.nextLevelExp,
      'isPending': instance.isPending,
    };
