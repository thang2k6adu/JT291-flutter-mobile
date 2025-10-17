// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => _TokenModel(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  expiredAt: _dateTimeFromJson(json['expiredAt'] as String?),
);

Map<String, dynamic> _$TokenModelToJson(_TokenModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiredAt': _dateTimeToJson(instance.expiredAt),
    };
