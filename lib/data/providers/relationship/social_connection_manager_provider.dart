import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_stats_provider.dart';

/// Centralized provider to manage all social connections (followers, following, friends)
/// This stores all users in a normalized way (Map<userId, UserModel>)
/// and provides methods to update user states synchronously across all lists
final socialConnectionManagerProvider =
    NotifierProvider<SocialConnectionManager, Map<String, UserModel>>(
      SocialConnectionManager.new,
    );

class SocialConnectionManager extends Notifier<Map<String, UserModel>> {
  late final UserGeneralService _service;

  @override
  Map<String, UserModel> build() {
    _service = ref.read(userGeneralServiceProvider);
    return {};
  }

  /// Add or update multiple users to the store
  void addUsers(List<UserModel> users) {
    final newState = {...state};
    for (final user in users) {
      newState[user.id] = user;
    }
    state = newState;
  }

  /// Add or update a single user to the store
  void addUser(UserModel user) {
    state = {...state, user.id: user};
  }

  /// Get a user by ID
  UserModel? getUser(String userId) {
    return state[userId];
  }

  /// Get multiple users by IDs
  List<UserModel> getUsers(List<String> userIds) {
    return userIds
        .map((id) => state[id])
        .where((user) => user != null)
        .cast<UserModel>()
        .toList();
  }

  /// Update a specific user in the store
  void updateUser(String userId, UserModel Function(UserModel) update) {
    final user = state[userId];
    if (user != null) {
      state = {...state, userId: update(user)};
    }
  }

  /// Follow a user - updates user state and calls API
  Future<bool> followUser(String currentUserId, String targetUserId) async {
    final user = state[targetUserId];
    if (user == null) {
      throw Exception('User not found');
    }

    // Optimistic update - update both user state and stats
    updateUser(
      targetUserId,
      (user) => user.copyWith(
        isFollowing: true,
        followStatus: "following",
        isPending: true,
      ),
    );
    ref.read(userStatsProvider.notifier).incrementFollowing();
    if (user.isFollower) {
      ref.read(userStatsProvider.notifier).incrementFriends();
    }

    print('followUser user is follower: ${user.isFollower}');

    try {
      print('followUser user: $user');
      final success = await _service.followUser(currentUserId, targetUserId);
      print('followUser success: $success');

      if (success) {
        print('followUser success: true, update user: ${user.copyWith(isPending: false)}');
        // Confirm the update
        updateUser(targetUserId, (user) => user.copyWith(isPending: false));
        return true;
      } else {
        // Rollback both user state and stats
        updateUser(
          targetUserId,
          (user) => user.copyWith(
            isFollowing: false,
            followStatus: 'not_following',
            isPending: false,
          ),
        );

        print('followUser decrement following: ${user}');
        ref.read(userStatsProvider.notifier).decrementFollowing();
        if (user.isFollower) {
          print('followUser user is follower: $user');
          ref.read(userStatsProvider.notifier).decrementFriends();
        }
        throw Exception('Follow user failed');
      }
    } catch (e) {
      // Rollback both user state and stats on error
      updateUser(
        targetUserId,
        (user) => user.copyWith(
          isFollowing: false,
          followStatus: 'not_following',
          isPending: false,
        ),
      );
      ref.read(userStatsProvider.notifier).decrementFollowing();
      if (user.isFollower) {
        ref.read(userStatsProvider.notifier).decrementFriends();
      }
      throw Exception('Follow user failed: $e');
    }
  }

  /// Unfollow a user - updates user state and calls API
  Future<bool> unfollowUser(String currentUserId, String targetUserId) async {
    final user = state[targetUserId];
    if (user == null) return false;

    // Optimistic update - update both user state and stats
    updateUser(
      targetUserId,
      (user) => user.copyWith(
        isFollowing: false,
        followStatus: "not_following",
        isPending: true,
      ),
    );
    ref.read(userStatsProvider.notifier).decrementFollowing();
    if (user.isFriend) {
      ref.read(userStatsProvider.notifier).decrementFriends();
    }
    try {
      final success = await _service.unfollowUser(currentUserId, targetUserId);

      if (success) {
        // Confirm the update
        updateUser(targetUserId, (user) => user.copyWith(isPending: false));
        return true;
      } else {
        // Rollback both user state and stats
        updateUser(
          targetUserId,
          (user) => user.copyWith(
            isFollowing: true,
            followStatus: 'following',
            isPending: false,
          ),
        );
        ref.read(userStatsProvider.notifier).incrementFollowing();
        if (user.isFriend) {
          ref.read(userStatsProvider.notifier).incrementFriends();
        }
        throw Exception('Unfollow user failed');
      }
    } catch (e) {
      // Rollback both user state and stats on error
      updateUser(
        targetUserId,
        (user) => user.copyWith(
          isFollowing: true,
          followStatus: 'following',
          isPending: false,
        ),
      );
      ref.read(userStatsProvider.notifier).incrementFollowing();
      if (user.isFollower) {
        ref.read(userStatsProvider.notifier).incrementFriends();
      }
      throw Exception('Unfollow user failed: $e');
    }
  }

  /// Unfriend a user - updates user state and calls API
  Future<bool> unfriendUser(String currentUserId, String targetUserId) async {
    final user = state[targetUserId];
    if (user == null) return false;

    // Optimistic update - update both user state and stats
    updateUser(
      targetUserId,
      (user) => user.copyWith(
        isFollowing: false,
        followStatus: "not_following",
        isPending: true,
      ),
    );
    ref.read(userStatsProvider.notifier).decrementFriends();
    ref.read(userStatsProvider.notifier).decrementFollowing();

    try {
      final success = await _service.unfriend(currentUserId, targetUserId);

      if (success) {
        // Confirm the update
        updateUser(targetUserId, (user) => user.copyWith(isPending: false));
        return true;
      } else {
        // Rollback both user state and stats
        updateUser(
          targetUserId,
          (user) => user.copyWith(
            isFollowing: true,
            followStatus: 'following',
            isPending: false,
          ),
        );
        ref.read(userStatsProvider.notifier).incrementFriends();
        throw Exception('Unfriend user failed');
      }
    } catch (e) {
      // Rollback both user state and stats on error
      updateUser(
        targetUserId,
        (user) => user.copyWith(
          isFollowing: true,
          followStatus: 'following',
          isPending: false,
        ),
      );
      ref.read(userStatsProvider.notifier).incrementFriends();
      if (user.isFollower) {
        ref.read(userStatsProvider.notifier).incrementFollowing();
      }
      throw Exception('Unfriend user failed: $e');
    }
  }

  /// Clear all users from the store
  void clear() {
    state = {};
  }
}
