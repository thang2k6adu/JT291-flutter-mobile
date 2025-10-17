// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_stream_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokenStreamModel _$TokenStreamModelFromJson(Map<String, dynamic> json) =>
    _TokenStreamModel(
      chatToken: json['chatToken'] as String,
      feedToken: json['feedToken'] as String? ?? '',
      apiKey: json['apiKey'] as String? ?? '',
      appId: json['appId'] as String? ?? '',
    );

Map<String, dynamic> _$TokenStreamModelToJson(_TokenStreamModel instance) =>
    <String, dynamic>{
      'chatToken': instance.chatToken,
      'feedToken': instance.feedToken,
      'apiKey': instance.apiKey,
      'appId': instance.appId,
    };
