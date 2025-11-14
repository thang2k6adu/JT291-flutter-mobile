import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_level_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Unified User Model - works for both current user and other users
/// Can handle both full profile data and summary data from lists
@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    // ========================================
    // Basic Info (always present)
    // ========================================
    required String id,
    @JsonKey(name: 'union_id') String? unionId,
    required String nickname,

    // ========================================
    // Profile Info
    // ========================================
    @Default('') @JsonKey(name: 'avatar') String avatar,
    String? bio,
    String? gender,
    @JsonKey(name: 'birthday') DateTime? birthday,

    // ========================================
    // Additional Profile Data (full profile only)
    // ========================================
    @Default([]) @JsonKey(name: 'profile_urls') List<String> profileUrls,
    @Default([]) List<String>? interests,

    // ========================================
    // Stats & Counts
    // ========================================
    @JsonKey(name: 'following_count') int? followingCount,
    @JsonKey(name: 'followers_count') int? followersCount,
    @JsonKey(name: 'views_count') int? viewsCount,

    // ========================================
    // Relationship Status (for other users)
    // ========================================
    @Default(false) @JsonKey(name: 'is_following') bool isFollowing,
    @Default('not_following')
    @JsonKey(name: 'follow_status')
    String followStatus,
    @Default(0)
    @JsonKey(name: 'mutual_followers_count')
    int mutualFollowersCount,

    // ========================================
    // Status & Flags
    // ========================================
    @JsonKey(name: 'role') @Default('user') String role,
    @Default(false) @JsonKey(name: 'is_deleted') bool isDeleted,
    @Default(false) @JsonKey(name: 'is_blocked') bool isBlocked,
    @Default(false) bool isPending,

    // ========================================
    // Level System (full profile only)
    // ========================================
    UserLevelModel? level,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
