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
}
