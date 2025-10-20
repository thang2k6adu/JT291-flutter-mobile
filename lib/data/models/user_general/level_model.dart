import 'package:freezed_annotation/freezed_annotation.dart';

part 'level_model.freezed.dart';
part 'level_model.g.dart';

@freezed
abstract class LevelModel with _$LevelModel {
  const factory LevelModel({
    String? id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    @JsonKey(name: 'is_deleted') bool? isDeleted,
    @JsonKey(name: 'current_level') int? currentLevel,
    @JsonKey(name: 'current_exp') int? currentExp,
    @JsonKey(name: 'total_exp') int? totalExp,
    @JsonKey(name: 'next_level_exp') int? nextLevelExp,
    @JsonKey(name: 'user_id') String? userId,
  }) = _LevelModel;

  factory LevelModel.fromJson(Map<String, dynamic> json) =>
      _$LevelModelFromJson(json);
}
