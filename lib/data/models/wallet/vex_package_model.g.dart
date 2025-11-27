// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vex_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VexPackageModel _$VexPackageModelFromJson(Map<String, dynamic> json) =>
    _VexPackageModel(
      packageId: (json['packageId'] as num).toInt(),
      vexAmount: (json['vexAmount'] as num).toInt(),
      baseDiamonds: (json['baseDiamonds'] as num).toInt(),
      bonusDiamonds: (json['bonusDiamonds'] as num).toInt(),
      totalDiamonds: (json['totalDiamonds'] as num).toInt(),
    );

Map<String, dynamic> _$VexPackageModelToJson(_VexPackageModel instance) =>
    <String, dynamic>{
      'packageId': instance.packageId,
      'vexAmount': instance.vexAmount,
      'baseDiamonds': instance.baseDiamonds,
      'bonusDiamonds': instance.bonusDiamonds,
      'totalDiamonds': instance.totalDiamonds,
    };
