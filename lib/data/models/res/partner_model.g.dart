// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartnerModel _$PartnerModelFromJson(Map<String, dynamic> json) =>
    _PartnerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      variant: json['variant'] as String?,
      isCompany: json['is_company'] as bool,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      otherPhone: json['other_phone'] as String?,
      website: json['website'] as String?,
      personalTaxCode: json['personal_tax_code'] as String?,
      address: json['address'] as String?,
      state: json['state'] as String?,
      street: json['street'] as String?,
    );

Map<String, dynamic> _$PartnerModelToJson(_PartnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'description': instance.description,
      'type': instance.type,
      'variant': instance.variant,
      'is_company': instance.isCompany,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'other_phone': instance.otherPhone,
      'website': instance.website,
      'personal_tax_code': instance.personalTaxCode,
      'address': instance.address,
      'state': instance.state,
      'street': instance.street,
    };
