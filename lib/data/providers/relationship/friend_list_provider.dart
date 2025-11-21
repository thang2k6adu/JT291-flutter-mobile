import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'package:jt291_flutter_mobile/data/providers/relationship/social_connection_manager_provider.dart';

/// Provider that manages the list of friend user IDs
/// Actual user data is stored in socialConnectionManagerProvider
final friendListProvider =
    AsyncNotifierProvider<FriendListNotifier, List<String>>(
      FriendListNotifier.new,
    );

class FriendListNotifier extends BasePaginatedNotifier<String> {
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
    final response = await _service.getFriendList(
      page: page,
      limit: limit,
      search: search,
    );

    final userResponse = ApiPaginatedResponse<UserModel>(response!);

    // add isFriend to each user
    final usersWithIsFriend = userResponse.data
        .map((user) => user.copyWith(isFollower: true))
        .toList();

    // Add users to central store
    ref
        .read(socialConnectionManagerProvider.notifier)
        .addUsers(usersWithIsFriend);

    // Return only IDs
    return _UserIdPaginatedResponse(userResponse);
  }

  /// Get full user models from IDs
  List<UserModel> getUsers() {
    final userIds = state.value ?? [];
    return ref.read(socialConnectionManagerProvider.notifier).getUsers(userIds);
  }

  /// Unfriend a user - delegates to central manager
  Future<void> unfriendUser(String userId, String friendId) async {
    await ref
        .read(socialConnectionManagerProvider.notifier)
        .unfriendUser(userId, friendId);
  }

  /// Follow a user (after unfriending) - delegates to central manager
  Future<void> followUser(String userId, String friendId) async {
    await ref
        .read(socialConnectionManagerProvider.notifier)
        .followUser(userId, friendId);
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
