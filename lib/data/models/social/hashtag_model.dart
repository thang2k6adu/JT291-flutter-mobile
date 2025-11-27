import 'package:freezed_annotation/freezed_annotation.dart';

part 'hashtag_model.freezed.dart';
part 'hashtag_model.g.dart';

/// Hashtag model for search results
@freezed
abstract class HashtagModel with _$HashtagModel {
  const factory HashtagModel({
    required String id,
    required String name,
  }) = _HashtagModel;

  factory HashtagModel.fromJson(Map<String, dynamic> json) =>
      _$HashtagModelFromJson(json);
}

/// Hashtag search response model
@freezed
abstract class HashtagSearchResponseModel with _$HashtagSearchResponseModel {
  const factory HashtagSearchResponseModel({
    required String query,
    required List<HashtagModel> result,
    @JsonKey(name: 'can_create') @Default(false) bool canCreate,
  }) = _HashtagSearchResponseModel;

  factory HashtagSearchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HashtagSearchResponseModelFromJson(json);
}

/// Hashtag detail model for hashtag screen
@freezed
abstract class HashtagDetailModel with _$HashtagDetailModel {
  const factory HashtagDetailModel({
    required String id,
    required String name,
    String? thumbnail,
    @JsonKey(name: 'post_count') @Default(0) int postCount,
    @JsonKey(name: 'view_count') @Default(0) int viewCount,
    @JsonKey(name: 'is_following') @Default(false) bool isFollowing,
  }) = _HashtagDetailModel;

  factory HashtagDetailModel.fromJson(Map<String, dynamic> json) =>
      _$HashtagDetailModelFromJson(json);
}

