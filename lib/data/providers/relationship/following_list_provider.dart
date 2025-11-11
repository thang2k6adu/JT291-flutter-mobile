import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final followingListProvider =
    AsyncNotifierProvider<FollowingListNotifier, List<UserModel>>(
      FollowingListNotifier.new,
    );

/// Wrapper để implement PaginatedResponse interface
class _FollowingResponse implements PaginatedResponse<UserModel> {
  final UserListResponse? _response;

  _FollowingResponse(this._response);

  @override
  List<UserModel> get data => _response?.data ?? [];

  @override
  bool get hasNext => _response?.pagination?.hasNext ?? false;
}

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
    final response = await _service.getFollowingList(
      page: page,
      limit: limit,
      search: search,
    );
    return _FollowingResponse(response);
  }

  /// Unfollow a user
  Future<void> unfollowUser(String userId, String followingId) async {
    await updateItemAsync(
      (user) => user.id == followingId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.unfollowUser(userId, followingId),
      (user, success) => user.copyWith(
        isFollowing: success ? false : user.isFollowing,
        isPending: false,
      ),
    );
  }

  /// Follow a user
  Future<void> followUser(String userId, String followingId) async {
    await updateItemAsync(
      (user) => user.id == followingId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.followUser(userId, followingId),
      (user, success) => user.copyWith(
        isFollowing: success ? true : user.isFollowing,
        isPending: false,
      ),
    );
  }
}
