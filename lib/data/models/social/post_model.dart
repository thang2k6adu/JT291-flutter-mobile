import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

/// Privacy type enum
enum PostPrivacy {
  @JsonValue('public')
  public,
  @JsonValue('friends')
  friends,
  @JsonValue('private')
  private,
}

/// Post model for social feed
@freezed
abstract class PostModel with _$PostModel {
  const factory PostModel({
    required String id,
    required UserModel user,
    required String content,
    @Default([]) @JsonKey(toJson: _mediaToJson, fromJson: _mediaFromJson) List<PostMediaModel> media,
    @Default([]) List<String> hashtags,
    @JsonKey(name: 'like_count') @Default(0) int likeCount,
    @JsonKey(name: 'comment_count') @Default(0) int commentCount,
    @JsonKey(name: 'share_count') @Default(0) int shareCount,
    @JsonKey(name: 'is_liked') @Default(false) bool isLiked,
    @JsonKey(name: 'is_bookmarked') @Default(false) bool isBookmarked,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @Default(PostPrivacy.public) PostPrivacy privacy,
    
    // Optional fields
    String? location,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
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

