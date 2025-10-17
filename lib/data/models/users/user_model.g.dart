// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  isDeleted: json['is_deleted'] as bool,
  unionId: json['union_id'] as String?,
  isBlocked: json['is_blocked'] as bool,
  status: json['status'] as String,
  language: json['language'] == null
      ? null
      : LanguageModel.fromJson(json['language'] as Map<String, dynamic>),
  role: json['role'] as String,
  partner: json['partner'] == null
      ? null
      : PartnerModel.fromJson(json['partner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_deleted': instance.isDeleted,
      'union_id': instance.unionId,
      'is_blocked': instance.isBlocked,
      'status': instance.status,
      'language': instance.language,
      'role': instance.role,
      'partner': instance.partner,
    };
