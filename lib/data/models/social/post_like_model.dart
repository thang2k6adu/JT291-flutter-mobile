import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';

part 'post_like_model.freezed.dart';
part 'post_like_model.g.dart';

/// Post like model
@freezed
abstract class PostLikeModel with _$PostLikeModel {
  const factory PostLikeModel({
    required String id,
    @JsonKey(name: 'post_id') required String postId,
    @JsonKey(name: 'user_id') required String userId,
    required String reaction,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required UserModel user,
  }) = _PostLikeModel;

  factory PostLikeModel.fromJson(Map<String, dynamic> json) =>
      _$PostLikeModelFromJson(json);
}

