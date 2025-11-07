import 'package:freezed_annotation/freezed_annotation.dart';

part 'viewer_model.freezed.dart';
part 'viewer_model.g.dart';

@freezed
abstract class ViewerModel with _$ViewerModel {
  const factory ViewerModel({
    required String viewerId,
    required String username,
    required String avatarUrl,
    required String gender,
    required String shortBio,
    required DateTime viewTime,
  }) = _ViewerModel;

  factory ViewerModel.fromJson(Map<String, dynamic> json) => _$ViewerModelFromJson(json);
}
