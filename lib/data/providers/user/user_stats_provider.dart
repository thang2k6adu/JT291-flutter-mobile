import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_stats_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';

final userStatsProvider =
    AsyncNotifierProvider<UserStatsNotifier, UserStatsModel?>(
      () => UserStatsNotifier(),
    );

class UserStatsNotifier extends AsyncNotifier<UserStatsModel?> {
  late final UserGeneralService _userService;

  @override
  Future<UserStatsModel?> build() async {
    print('build user stats');
    final user = ref.watch(userGeneralProvider).value;

    if (user == null) {
      print('user is null');
      return null; // Nếu user null, trả về null
    }

    _userService = ref.read(userGeneralServiceProvider);

    try {
      print('getUserStats: ${user.id}');
      final stats = await _userService.getUserStats(user.id);
      print('getUserStats stats: $stats');
      return stats; // Trả về stats, đồng thời state sẽ tự thành AsyncData(stats)
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  Future<UserStatsModel?> getUserStats(String userId) async {
    print('getUserStats: $userId');
    try {
      final stats = await _userService.getUserStats(userId);
      state = AsyncData(stats);
      return stats;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  void incrementFollowing() {
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(followingCount: current.followingCount! + 1));
    }
  }

  void decrementFollowing() {
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(followingCount: current.followingCount! - 1));
    }
  }

  void incrementFollowers() {
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(followersCount: current.followersCount! + 1));
    }
  }

  void decrementFollowers() {
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(followersCount: current.followersCount! - 1));
    }
  }

  void incrementFriends() {
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(friendsCount: current.friendsCount! + 1));
    }
  }

  void decrementFriends() {
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(friendsCount: current.friendsCount! - 1));
    }
  }

  void incrementViews() {
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(viewsCount: current.viewsCount! + 1));
    }
  }

  void decrementViews() {
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(viewsCount: current.viewsCount! - 1));
    }
  }
}
