// lib/features/profile/providers/user_profile_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_relationship_model.dart';

part 'user_profile_state.freezed.dart';

/// State cho User Profile Screen
/// Quản lý tất cả data cần thiết cho màn hình profile
@freezed
abstract class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    /// User profile data
    UserModel? user,
    
    /// Relationship với current user
    UserRelationshipModel? relationship,
    
    /// Loading states
    @Default(true) bool isLoading,
    @Default(false) bool isFollowLoading,
    
    /// Error handling
    String? error,
    
    /// Profile images for carousel
    @Default([]) List<String> profileImages,
  }) = _UserProfileState;
  
  const UserProfileState._();
  
  /// Helper để check xem có đang load không
  bool get hasData => user != null && relationship != null;
  
  /// Helper để check xem có phải profile của mình không
  bool get isMe => relationship?.isMe ?? true;
  
  /// Helper để lấy avatar URL với fallback
  String get avatarUrl => user?.avatar ?? '';
  
  /// Helper để lấy nickname với fallback
  String get nickname => user?.nickname ?? 'Unknown User';
}

