import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_summary_model.freezed.dart';
part 'user_summary_model.g.dart';

@freezed
abstract class UserSummaryModel with _$UserSummaryModel {
  const factory UserSummaryModel({
    String? id,
    String? username,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? gender,
    @JsonKey(name: 'short_bio') String? shortBio,
    @JsonKey(name: 'is_following') bool? isFollowing,
    @Default(false) bool isPending,
  }) = _UserSummaryModel;

  factory UserSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$UserSummaryModelFromJson(json);
}
