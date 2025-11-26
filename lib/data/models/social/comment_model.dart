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
    required UserModel user,
    required String content,
    @Default([]) List<PostMediaModel> media,
    @JsonKey(name: 'like_count') @Default(0) int likeCount,
    @JsonKey(name: 'reply_count') @Default(0) int replyCount,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'parent_comment_id') String? parentCommentId,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

