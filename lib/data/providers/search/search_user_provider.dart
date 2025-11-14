import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_stats_provider.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

/// Provider để quản lý search users với pagination
final searchUserProvider =
    AsyncNotifierProvider<SearchUserNotifier, List<UserModel>>(
      SearchUserNotifier.new,
    );

/// Notifier xử lý search users với pagination, follow/unfollow
class SearchUserNotifier extends BasePaginatedNotifier<UserModel>
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
    final apiResponse = await _service.searchUsers(
      query: search ?? '',
      page: page,
      limit: limit,
    );

    print('Search users apiResponse (provider): $apiResponse');
    // Wrap bằng ApiPaginatedResponse chuẩn từ base class
    final response = ApiPaginatedResponse(apiResponse);

    // Log error nếu có
    if (response.hasError) {
      print('Search users error: ${response.errorMessage}');
    }

    return response;
  }

  /// Follow một user
  Future<void> followUser(String userId, String targetUserId) async {
    await updateItemAsync(
      (user) => user.id == targetUserId,
      (user) {
        ref.read(userStatsProvider.notifier).incrementFollowing();

        return user.copyWith(
          isFollowing: true,
          followStatus: "following",
          isPending: true,
        );
      },
      () async => await _service.followUser(userId, targetUserId),
      (user, success) {
        if (!success) {
          // rollback
          ref.read(userStatsProvider.notifier).decrementFollowing();

          return user.copyWith(
            isFollowing: false,
            followStatus: 'not_following',
            isPending: false,
          );
        }

        // Nếu success → giữ trạng thái optimistic
        return user.copyWith(isPending: false);
      },
    );
  }

  /// Unfollow một user
  Future<void> unfollowUser(String userId, String targetUserId) async {
    await updateItemAsync(
      (user) => user.id == targetUserId,
      (user) {
        ref.read(userStatsProvider.notifier).decrementFollowing();

        return user.copyWith(
          isFollowing: false,
          followStatus: "not_following",
          isPending: true,
        );
      },
      () async => await _service.unfollowUser(userId, targetUserId),
      (user, success) {
        if (!success) {
          // rollback
          ref.read(userStatsProvider.notifier).incrementFollowing();

          return user.copyWith(
            isFollowing: true,
            followStatus: 'following',
            isPending: false,
          );
        }

        return user.copyWith(isPending: false);
      },
    );
  }
}
