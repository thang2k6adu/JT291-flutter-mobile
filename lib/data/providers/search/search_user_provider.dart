import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

/// Provider để quản lý search users với pagination
final searchUserProvider =
    AsyncNotifierProvider<SearchUserNotifier, List<UserModel>>(
      SearchUserNotifier.new,
    );

/// Wrapper để convert ApiResponse<PaginatedData<T>> sang PaginatedResponse interface
class _ApiPaginatedResponse implements PaginatedResponse<UserModel> {
  final ApiResponse<PaginatedData<UserModel>> _response;

  const _ApiPaginatedResponse(this._response);

  @override
  List<UserModel> get data {
    // Nếu có error hoặc data null, return empty list
    if (_response.error || _response.data == null) {
      return [];
    }
    return _response.data!.items;
  }

  @override
  bool get hasNext {
    // Nếu có error hoặc data null, return false
    if (_response.error || _response.data == null) {
      return false;
    }
    final meta = _response.data!.meta;
    return meta.currentPage < meta.totalPages;
  }
}

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
    
    // Log error nếu có
    if (apiResponse.error) {
      print('Search users error: ${apiResponse.message}');
    }
    
    return _ApiPaginatedResponse(apiResponse);
  }

  /// Follow một user
  Future<void> followUser(String userId, String targetUserId) async {
    await updateItemAsync(
      (user) => user.id == targetUserId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.followUser(userId, targetUserId),
      (user, success) => user.copyWith(
        isFollowing: success,
        followStatus: success ? 'following' : user.followStatus,
        isPending: false,
      ),
    );
  }

  /// Unfollow một user
  Future<void> unfollowUser(String userId, String targetUserId) async {
    await updateItemAsync(
      (user) => user.id == targetUserId,
      (user) => user.copyWith(isPending: true),
      () async => await _service.unfollowUser(userId, targetUserId),
      (user, success) => user.copyWith(
        isFollowing: !success,
        followStatus: success ? 'not_following' : user.followStatus,
        isPending: false,
      ),
    );
  }
}

