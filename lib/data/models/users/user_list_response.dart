import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_summary_model.dart';
import 'pagination_model.dart';

part 'user_list_response.freezed.dart';
part 'user_list_response.g.dart';

@freezed
abstract class UserListResponse with _$UserListResponse {
  const factory UserListResponse({
    @JsonKey(name: 'user_id') String? userId,
    String? username,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'following_count') int? followingCount,
    @JsonKey(name: 'followers_count') int? followersCount,
    @JsonKey(name: 'friends_count') int? friendsCount,
    List<UserSummaryModel>? data,
    PaginationModel? pagination,
    @Default(false) bool isPending,
  }) = _UserListResponse;

  factory UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseFromJson(json);
}
