// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashtag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HashtagModel _$HashtagModelFromJson(Map<String, dynamic> json) =>
    _HashtagModel(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$HashtagModelToJson(_HashtagModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_HashtagSearchResponseModel _$HashtagSearchResponseModelFromJson(
  Map<String, dynamic> json,
) => _HashtagSearchResponseModel(
  query: json['query'] as String,
  result: (json['result'] as List<dynamic>)
      .map((e) => HashtagModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  canCreate: json['can_create'] as bool? ?? false,
);

Map<String, dynamic> _$HashtagSearchResponseModelToJson(
  _HashtagSearchResponseModel instance,
) => <String, dynamic>{
  'query': instance.query,
  'result': instance.result,
  'can_create': instance.canCreate,
};
