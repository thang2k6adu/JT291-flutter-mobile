import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final searchUserProvider =
    AsyncNotifierProvider<SearchUserNotifier, List<UserModel>>(
      SearchUserNotifier.new,
    );

/// Wrapper để implement PaginatedResponse interface
class _SearchUserResponse implements PaginatedResponse<UserModel> {
  final UserListResponse? _response;

  _SearchUserResponse(this._response);

  @override
  List<UserModel> get data => _response?.data ?? [];

  @override
  bool get hasNext => _response?.pagination?.hasNext ?? false;
}

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
    final response = await _service.searchUsers(
      query: search ?? '',
      page: page,
      limit: limit,
    );
    return _SearchUserResponse(response);
  }

  /// Follow a user
  Future<void> followUser(String userId, String targetUserId) async {
    await updateItemAsync(
      (user) => user.id == targetUserId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.followUser(userId, targetUserId),
      (user, success) => user.copyWith(
        isFollowing: success ? true : user.isFollowing,
        isPending: false,
      ),
    );
  }

  /// Unfollow a user
  Future<void> unfollowUser(String userId, String targetUserId) async {
    await updateItemAsync(
      (user) => user.id == targetUserId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.unfollowUser(userId, targetUserId),
      (user, success) => user.copyWith(
        isFollowing: success ? false : user.isFollowing,
        isPending: false,
      ),
    );
  }
}

