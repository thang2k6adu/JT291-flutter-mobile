import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_list_response.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final followerListProvider =
    AsyncNotifierProvider<FollowerListNotifier, List<UserSummaryModel>>(
      FollowerListNotifier.new,
    );

/// Wrapper để implement PaginatedResponse interface
class _FollowerResponse implements PaginatedResponse<UserSummaryModel> {
  final UserListResponse? _response;

  _FollowerResponse(this._response);

  @override
  List<UserSummaryModel> get data => _response?.data ?? [];

  @override
  bool get hasNext => _response?.pagination?.hasNext ?? false;
}

class FollowerListNotifier extends BasePaginatedNotifier<UserSummaryModel>
    with ListItemUpdateMixin<UserSummaryModel> {
  late final UserGeneralService _service;

  @override
  Future<List<UserSummaryModel>> build() async {
    _service = ref.read(userGeneralServiceProvider);
    return super.build();
  }

  @override
  Future<PaginatedResponse<UserSummaryModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    final response = await _service.getFollowerList(
      page: page,
      limit: limit,
      search: search,
    );
    return _FollowerResponse(response);
  }

  /// Follow back a follower
  Future<void> followBackUser(String userId, String followerId) async {
    await updateItemAsync(
      (user) => user.id == followerId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.followUser(userId, followerId),
      (user, success) => user.copyWith(
        isFollowing: success ? true : user.isFollowing,
        isPending: false,
      ),
    );
  }

  /// Unfollow a follower
  Future<void> unfollowUser(String userId, String followerId) async {
    await updateItemAsync(
      (user) => user.id == followerId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.unfollowUser(userId, followerId),
      (user, success) => user.copyWith(
        isFollowing: success ? false : user.isFollowing,
        isPending: false,
      ),
    );
  }
}
