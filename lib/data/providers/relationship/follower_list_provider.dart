import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_stats_provider.dart';

final followerListProvider =
    AsyncNotifierProvider<FollowerListNotifier, List<UserModel>>(
      FollowerListNotifier.new,
    );

class FollowerListNotifier extends BasePaginatedNotifier<UserModel>
    with ListItemUpdateMixin<UserModel> {
  late final UserGeneralService _service;

  @override
  Future<List<UserModel>> build() async {
    _service = ref.read(userGeneralServiceProvider);
    return super.build();
  }

  @override
  Future<PaginatedResponse<UserModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await _service.getFollowerList(
      page: page,
      limit: limit,
      search: search,
    );
    return ApiPaginatedResponse<UserModel>(response!);
  }

  /// Follow back a follower
  Future<void> followBackUser(String userId, String followerId) async {
    await updateItemAsync(
      (user) => user.id == followerId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.followUser(userId, followerId),
      (user, success) {
        if (success) {
          // update stats
          ref.read(userStatsProvider.notifier).incrementFollowers();
        }
        return user.copyWith(
          isFollowing: success ? true : user.isFollowing,
          isPending: false,
        );
      },
    );
  }

  /// Unfollow a follower
  Future<void> unfollowUser(String userId, String followerId) async {
    await updateItemAsync(
      (user) => user.id == followerId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.unfollowUser(userId, followerId),
      (user, success) {
        if (success) {
          // update stats
          ref.read(userStatsProvider.notifier).decrementFollowers();
        }
        return user.copyWith(
          isFollowing: success ? false : user.isFollowing,
          isPending: false,
        );
      },
    );
  }
}
