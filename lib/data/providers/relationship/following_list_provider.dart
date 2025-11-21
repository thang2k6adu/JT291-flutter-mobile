import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/social_connection_manager_provider.dart';

/// Provider that manages the list of following user IDs
/// Actual user data is stored in socialConnectionManagerProvider
final followingListProvider =
    AsyncNotifierProvider<FollowingListNotifier, List<String>>(
      FollowingListNotifier.new,
    );

class FollowingListNotifier extends BasePaginatedNotifier<String> {
  late final UserGeneralService _service;

  @override
  Future<List<String>> build() async {
    _service = ref.read(userGeneralServiceProvider);
    return super.build();
  }

  @override
  Future<PaginatedResponse<String>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    final apiResponse = await _service.getFollowingList(
      page: page,
      limit: limit,
      search: search,
    );
    print('Search users apiResponse (provider): ${apiResponse?.data?.items.length ?? 0}');
    
    // Wrap bằng ApiPaginatedResponse chuẩn từ base class
    final userResponse = ApiPaginatedResponse<UserModel>(apiResponse!);

    // Log error nếu có
    if (userResponse.hasError) {
      print('Search users error: ${userResponse.errorMessage}');
    }

    // Add users to central store
    ref.read(socialConnectionManagerProvider.notifier).addUsers(userResponse.data);

    // Return only IDs
    return _UserIdPaginatedResponse(userResponse);
  }

  /// Get full user models from IDs
  List<UserModel> getUsers() {
    final userIds = state.value ?? [];
    return ref.read(socialConnectionManagerProvider.notifier).getUsers(userIds);
  }

  /// Unfollow a user - delegates to central manager
  Future<void> unfollowUser(String userId, String followingId) async {
    await ref.read(socialConnectionManagerProvider.notifier)
        .unfollowUser(userId, followingId);
  }

  /// Follow a user - delegates to central manager
  Future<void> followUser(String userId, String followingId) async {
    await ref.read(socialConnectionManagerProvider.notifier)
        .followUser(userId, followingId);
  }
}

/// Helper class to convert UserModel pagination to String (ID) pagination
class _UserIdPaginatedResponse implements PaginatedResponse<String> {
  final PaginatedResponse<UserModel> _userResponse;

  _UserIdPaginatedResponse(this._userResponse);

  @override
  List<String> get data => _userResponse.data.map((user) => user.id).toList();

  @override
  bool get hasNext => _userResponse.hasNext;
}
