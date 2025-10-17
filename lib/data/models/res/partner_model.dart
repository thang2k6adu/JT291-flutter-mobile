import 'package:freezed_annotation/freezed_annotation.dart';

part 'partner_model.freezed.dart';
part 'partner_model.g.dart';

@freezed
abstract class PartnerModel with _$PartnerModel {
  const factory PartnerModel({
    required String id,
    required String name,
    String? thumbnail,
    String? description,
    String? type,
    String? variant,
    @JsonKey(name: 'is_company') required bool isCompany,
    String? email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'other_phone') String? otherPhone,
    String? website,
    @JsonKey(name: 'personal_tax_code') String? personalTaxCode,
    String? address,
    String? state,
    String? street,
  }) = _PartnerModel;

  factory PartnerModel.fromJson(Map<String, Object?> json) =>
      _$PartnerModelFromJson(json);
}
