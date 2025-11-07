// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileViewModel _$ProfileViewModelFromJson(Map<String, dynamic> json) =>
    _ProfileViewModel(
      userId: json['userId'] as String,
      canViewFull: json['canViewFull'] as bool,
      total: (json['total'] as num).toInt(),
      views: (json['views'] as List<dynamic>)
          .map((e) => ViewerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: PaginationModel.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ProfileViewModelToJson(_ProfileViewModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'canViewFull': instance.canViewFull,
      'total': instance.total,
      'views': instance.views,
      'pagination': instance.pagination,
    };
