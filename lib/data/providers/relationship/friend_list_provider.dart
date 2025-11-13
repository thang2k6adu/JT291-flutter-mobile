import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_stats_provider.dart';

final friendListProvider =
    AsyncNotifierProvider<FriendListNotifier, List<UserModel>>(
      FriendListNotifier.new,
    );

/// Wrapper để implement PaginatedResponse interface
class _FriendResponse implements PaginatedResponse<UserModel> {
  final UserListResponse? _response;

  _FriendResponse(this._response);

  @override
  List<UserModel> get data => _response?.data ?? [];

  @override
  bool get hasNext => _response?.pagination?.hasNext ?? false;
}

class FriendListNotifier extends BasePaginatedNotifier<UserModel>
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
    final response = await _service.getFriendList(
      page: page,
      limit: limit,
      search: search,
    );
    return _FriendResponse(response);
  }

  /// Unfriend a user
  Future<void> unfriendUser(String userId, String friendId) async {
    await updateItemAsync(
      (user) => user.id == friendId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.unfriend(userId, friendId),
      (user, success) {
        if (success) {
          // update stats
          ref.read(userStatsProvider.notifier).decrementFriends();
        }
        return user.copyWith(
          isFollowing: success ? false : user.isFollowing,
          isPending: false,
        );
      },
    );
  }

  /// Follow a user (after unfriending)
  Future<void> followUser(String userId, String friendId) async {
    await updateItemAsync(
      (user) => user.id == friendId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.followUser(userId, friendId),
      (user, success) {
        if (success) {
          // update stats
          ref.read(userStatsProvider.notifier).incrementFriends();
        }
        return user.copyWith(
          isFollowing: success ? true : user.isFollowing,
          isPending: false,
        );
      },
    );
  }
}
