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
    String? uid,
    @JsonKey(name: 'union_id') String? unionId,
    required String nickname,
    String? username,
    
    // ========================================
    // Profile Info
    // ========================================
    @Default('') @JsonKey(name: 'avatar_url') String avatarUrl,
    String? bio,
    @Default('') @JsonKey(name: 'short_bio') String shortBio,
    String? gender,
    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,
    
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
    @Default('not_following') @JsonKey(name: 'follow_status') String followStatus,
    @Default(0) @JsonKey(name: 'mutual_followers_count') int mutualFollowersCount,
    
    // ========================================
    // Status & Flags
    // ========================================
    @Default(false) bool verified,
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
