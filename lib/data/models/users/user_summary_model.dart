import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_summary_model.freezed.dart';
part 'user_summary_model.g.dart';

@freezed
abstract class UserSummaryModel with _$UserSummaryModel {
  const factory UserSummaryModel({
    String? id,
    String? uid,
    String? username,
    String? nickname,
    @Default('') @JsonKey(name: 'avatar_url') String avatarUrl,
    String? bio,
    String? gender,
    @Default('') @JsonKey(name: 'short_bio') String shortBio,
    @Default(false) @JsonKey(name: 'is_following') bool isFollowing,
    @Default('not_following') @JsonKey(name: 'follow_status') String followStatus,
    @Default(false) bool verified,
    @Default(0) @JsonKey(name: 'mutual_followers_count') int mutualFollowersCount,
    @Default(false) bool isPending,
  }) = _UserSummaryModel;

  factory UserSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryModelFromJson(json);
}
