import 'package:freezed_annotation/freezed_annotation.dart';
import 'level_model.dart';

part 'user_general.freezed.dart';
part 'user_general.g.dart';

@freezed
abstract class UserGeneralModel with _$UserGeneralModel {
  const factory UserGeneralModel({
    String? id,
    @JsonKey(name: 'is_deleted') bool? isDeleted,
    @JsonKey(name: 'union_id') String? unionId,
    @JsonKey(name: 'is_blocked') bool? isBlocked,
    String? nickname,
    String? gender,
    String? bio,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    @JsonKey(name: 'profile_urls') List<String>? profileUrls,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'following_count') int? followingCount,
    @JsonKey(name: 'followers_count') int? followersCount,
    @JsonKey(name: 'views_count') int? viewsCount,
    List<String>? interests,
    LevelModel? level,
  }) = _UserGeneralModel;

  factory UserGeneralModel.fromJson(Map<String, dynamic> json) =>
      _$UserGeneralModelFromJson(json);
}