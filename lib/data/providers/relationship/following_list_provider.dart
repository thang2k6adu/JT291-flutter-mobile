import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_stats_provider.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';

final followingListProvider =
    AsyncNotifierProvider<FollowingListNotifier, List<UserModel>>(
      FollowingListNotifier.new,
    );

class FollowingListNotifier extends BasePaginatedNotifier<UserModel>
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
    final apiResponse = await _service.getFollowingList(
      page: page,
      limit: limit,
      search: search,
    );
    print('Search users apiResponse (provider): $apiResponse');
    // Wrap bằng ApiPaginatedResponse chuẩn từ base class
    final response = ApiPaginatedResponse<UserModel>(apiResponse!);

    // Log error nếu có
    if (response.hasError) {
      print('Search users error: ${response.errorMessage}');
    }

    return response;
  }

  /// Unfollow a user
  Future<void> unfollowUser(String userId, String followingId) async {
    await updateItemAsync(
      (user) => user.id == followingId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.unfollowUser(userId, followingId),
      (user, success) {
        if (success) {
          // update stats
          ref.read(userStatsProvider.notifier).decrementFollowing();
        }
        return user.copyWith(
          isFollowing: success ? false : user.isFollowing,
          isPending: false,
        );
      },
    );
  }

  /// Follow a user
  Future<void> followUser(String userId, String followingId) async {
    await updateItemAsync(
      (user) => user.id == followingId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.followUser(userId, followingId),
      (user, success) {
        if (success) {
          // update stats
          ref.read(userStatsProvider.notifier).incrementFollowing();
        }
        return user.copyWith(
          isFollowing: success ? true : user.isFollowing,
          isPending: false,
        );
      },
    );
  }
}
