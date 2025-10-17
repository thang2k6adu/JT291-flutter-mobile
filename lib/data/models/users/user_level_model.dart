import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_level_model.freezed.dart';
part 'user_level_model.g.dart';

@freezed
abstract class UserLevelModel with _$UserLevelModel {
  const factory UserLevelModel({
    @JsonKey(name: 'current_level') @Default(0) int currentLevel,
    @JsonKey(name: 'current_exp') @Default(0) int currentExp,
    @JsonKey(name: 'total_exp') @Default(0) int totalExp,
    @JsonKey(name: 'next_level_exp') @Default(50) int nextLevelExp,
  }) = _UserLevelModel;

  factory UserLevelModel.fromJson(Map<String, Object?> json) =>
      _$UserLevelModelFromJson(json);
}
