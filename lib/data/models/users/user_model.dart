import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/res/language_model.dart';
import 'package:jt291_flutter_mobile/data/models/res/partner_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    @JsonKey(name: 'is_deleted') required bool isDeleted,
    @JsonKey(name: 'union_id') String? unionId,
    @JsonKey(name: 'is_blocked') required bool isBlocked,
    required String status,
    // String? country,
    LanguageModel? language,
    required String role,
    PartnerModel? partner,
    // EmployeeModel? employee,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
