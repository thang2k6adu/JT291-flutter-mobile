import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_general.freezed.dart';
part 'user_general.g.dart';

@freezed
abstract class UserGeneralModel with _$UserGeneralModel {
  const factory UserGeneralModel({
    String? id,
    String? gender,
    String? nickname,
    String? bio,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'profile_urls') List<String>? profileUrls,
    List<String>? interests,
  }) = _UserGeneralModel;

  factory UserGeneralModel.fromJson(Map<String, dynamic> json) =>
      _$UserGeneralModelFromJson(json);
}