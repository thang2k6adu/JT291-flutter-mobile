import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_level_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

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
    @JsonKey(name: 'avatar', fromJson: _stringFromJson)
    @Default('')
    String? avatar,

    @JsonKey(fromJson: _nullableString)
    String? bio,

    @JsonKey(fromJson: _nullableString)
    String? gender,

    @JsonKey(name: 'birthday')
    DateTime? birthday,

    // ========================================
    // Additional Profile Data
    // ========================================
    @JsonKey(name: 'profile_urls', fromJson: _listStringFromJson)
    @Default([])
    List<String> profileUrls,

    @JsonKey(fromJson: _listStringFromJsonNullable)
    @Default([])
    List<String>? interests,

    // ========================================
    // Stats
    // ========================================
    @JsonKey(name: 'following_count')
    int? followingCount,

    @JsonKey(name: 'followers_count')
    int? followersCount,

    @JsonKey(name: 'views_count')
    int? viewsCount,

    // ========================================
    // Relationship Status
    // ========================================
    @JsonKey(name: 'is_following')
    @Default(false)
    bool isFollowing,

    @JsonKey(name: 'is_follower')
    @Default(false)
    bool isFollower,

    @JsonKey(name: 'is_friend')
    @Default(false)
    bool isFriend,

    @JsonKey(name: 'follow_status')
    @Default('not_following')
    String followStatus,

    @JsonKey(name: 'mutual_followers_count')
    @Default(0)
    int mutualFollowersCount,

    // ========================================
    // Flags
    // ========================================
    @JsonKey(name: 'role')
    @Default('user')
    String role,

    @JsonKey(name: 'is_deleted')
    @Default(false)
    bool isDeleted,

    @JsonKey(name: 'is_blocked')
    @Default(false)
    bool isBlocked,

    @Default(false)
    bool isPending,

    // ========================================
    // Level
    // ========================================
    UserLevelModel? level,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

//
// ===============================
// Helpers để xử lý null an toàn
// ===============================
//

// String? → fallback về ""
String _stringFromJson(Object? v) => v == null ? '' : (v as String);

// String? → giữ nguyên null
String? _nullableString(Object? v) => v == null ? null : (v as String);

// List<dynamic>? → List<String>
List<String> _listStringFromJson(Object? v) {
  if (v == null) return [];
  try {
    return List<String>.from(v as List);
  } catch (_) {
    return [];
  }
}

// List<dynamic>? → List<String>? (nếu API trả null → [])
List<String> _listStringFromJsonNullable(Object? v) {
  if (v == null) return [];
  try {
    return List<String>.from(v as List);
  } catch (_) {
    return [];
  }
}
