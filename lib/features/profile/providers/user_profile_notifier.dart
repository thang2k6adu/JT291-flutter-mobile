// lib/features/profile/providers/user_profile_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_relationship_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'package:jt291_flutter_mobile/features/profile/providers/user_profile_state.dart';

/// Provider cho User Profile Screen
/// Quản lý state và business logic cho profile screen
final userProfileProvider = StateNotifierProvider.family<UserProfileNotifier, UserProfileState, String?>(
  (ref, userId) {
    final userService = ref.read(userGeneralServiceProvider);
    return UserProfileNotifier(
      userService: userService,
      userId: userId,
    );
  },
);

/// Notifier quản lý state và logic cho User Profile Screen
class UserProfileNotifier extends StateNotifier<UserProfileState> {
  final UserGeneralService userService;
  final String? userId;

  UserProfileNotifier({
    required this.userService,
    required this.userId,
  }) : super(const UserProfileState()) {
    // Load data khi khởi tạo
    loadProfile();
  }

  /// Load profile data (user info + relationship)
  Future<void> loadProfile() async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // Load user data và relationship song song
      final results = await Future.wait([
        _loadUserData(),
        _loadRelationship(),
      ]);

      final user = results[0] as UserModel?;
      final relationship = results[1] as UserRelationshipModel;

      // Build profile images từ user data
      final profileImages = _buildProfileImages(user);

      state = state.copyWith(
        user: user,
        relationship: relationship,
        profileImages: profileImages,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load profile: $e',
      );
    }
  }

  /// Load user data
  Future<UserModel?> _loadUserData() async {
    if (userId == null || userId!.isEmpty) {
      // Load current user
      return await userService.getCurrentUser();
    } else {
      // Load other user's profile
      return await userService.getUserProfile(userId!);
    }
  }

  /// Load relationship data
  Future<UserRelationshipModel> _loadRelationship() async {
    if (userId == null || userId!.isEmpty) {
      // Viewing own profile
      return const UserRelationshipModel(isMe: true);
    } else {
      // Viewing other user's profile
      return await userService.getUserRelationship(userId!);
    }
  }

  /// Build profile images list từ user data
  List<String> _buildProfileImages(UserModel? user) {
    if (user == null) return [];

    final images = <String>[];

    
    // Add profile URLs nếu có
    if (user.profileUrls.isNotEmpty) {
      images.addAll(user.profileUrls);
      print('have profile urls images: $images');
    }
    
    // Nếu không có ảnh nào, thêm placeholder
    if (images.isEmpty) {
      print('no images, add placeholder image');
      images.add('https://i.pravatar.cc/400?u=${user.id}');
    }
    
    return images;
  }

  /// Follow user
  Future<void> followUser({required String currentUserId}) async {
    if (userId == null || state.relationship?.isMe == true) return;

    try {
      state = state.copyWith(isFollowLoading: true);

      final success = await userService.followUser(currentUserId, userId!);

      if (success) {
        // Update relationship state
        state = state.copyWith(
          relationship: state.relationship?.copyWith(
            isFollowing: true,
            isFriend: state.relationship?.isFollower == true, // If they follow us back, we're friends
          ),
          isFollowLoading: false,
        );
      } else {
        state = state.copyWith(
          isFollowLoading: false,
          error: 'Failed to follow user',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isFollowLoading: false,
        error: 'Failed to follow user: $e',
      );
    }
  }

  /// Unfollow user
  Future<void> unfollowUser({required String currentUserId}) async {
    if (userId == null || state.relationship?.isMe == true) return;

    try {
      state = state.copyWith(isFollowLoading: true);

      final success = await userService.unfollowUser(currentUserId, userId!);

      if (success) {
        // Update relationship state
        state = state.copyWith(
          relationship: state.relationship?.copyWith(
            isFollowing: false,
            isFriend: false, // Can't be friends if we unfollow
          ),
          isFollowLoading: false,
        );
      } else {
        state = state.copyWith(
          isFollowLoading: false,
          error: 'Failed to unfollow user',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isFollowLoading: false,
        error: 'Failed to unfollow user: $e',
      );
    }
  }

  /// Refresh profile data
  Future<void> refresh() async {
    await loadProfile();
  }

  /// Clear error message
  void clearError() {
    state = state.copyWith(error: null);
  }
}

