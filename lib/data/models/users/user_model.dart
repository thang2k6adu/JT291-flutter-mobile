import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_level_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'is_deleted') @Default(false) bool isDeleted,
    @JsonKey(name: 'union_id') required String unionId,
    @JsonKey(name: 'is_blocked') @Default(false) bool isBlocked,
    required nickname,
    String? gender,
    String? bio,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    @JsonKey(name: 'profile_urls') @Default([]) List<String> profileUrls,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'following_count') int? followingCount,
    @JsonKey(name: 'followers_count') int? followersCount,
    @JsonKey(name: 'views_count') int? viewsCount,
    List<String>? interests,
    UserLevelModel? level,
    @Default(false) bool isPending,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
