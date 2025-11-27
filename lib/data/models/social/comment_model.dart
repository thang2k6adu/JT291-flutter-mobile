import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart';

/// Comment model for social feed posts
@freezed
abstract class CommentModel with _$CommentModel {
  const factory CommentModel({
    required String id,
    @JsonKey(name: 'post_id') required String postId,
    @JsonKey(name: 'user_id') required String userId,
    required UserModel user,
    required String content,
    @Default([]) @JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) List<PostMediaModel> media,
    @JsonKey(name: 'like_count') @Default(0) int likeCount,
    @JsonKey(name: 'replies_count') @Default(0) int repliesCount,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @JsonKey(name: 'parent_id') String? parentId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

/// Helper functions for PostMediaModel serialization
List<Map<String, dynamic>> _mediaToJson(List<PostMediaModel> media) {
  return media.map((m) => m.toJson()).toList();
}

List<PostMediaModel> _mediaFromJson(List<dynamic> json) {
  return json
      .map((item) => PostMediaModel.fromJson(item as Map<String, dynamic>))
      .toList();
}

