import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_stats_model.freezed.dart';
part 'user_stats_model.g.dart';

@freezed
abstract class UserStatsModel with _$UserStatsModel {
  const factory UserStatsModel({
    @JsonKey(name: 'following_count') int? followingCount,
    @JsonKey(name: 'followers_count') int? followersCount,
    @JsonKey(name: 'friends_count') int? friendsCount,
    @Default(false) bool isPending,
  }) = _UserStatsModel;

  factory UserStatsModel.fromJson(Map<String, dynamic> json) =>
      _$UserStatsModelFromJson(json);
}
