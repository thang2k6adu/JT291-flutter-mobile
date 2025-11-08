// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_package_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RechargePackageModel _$RechargePackageModelFromJson(
  Map<String, dynamic> json,
) => _RechargePackageModel(
  packageId: (json['packageId'] as num).toInt(),
  diamonds: (json['diamonds'] as num).toInt(),
  price: (json['price'] as num).toInt(),
);

Map<String, dynamic> _$RechargePackageModelToJson(
  _RechargePackageModel instance,
) => <String, dynamic>{
  'packageId': instance.packageId,
  'diamonds': instance.diamonds,
  'price': instance.price,
};
