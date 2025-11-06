import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/following_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final followingListProvider =
    AsyncNotifierProvider<FollowingListNotifier, List<FollowingModel>>(
  () => FollowingListNotifier(),
);

class FollowingListNotifier extends AsyncNotifier<List<FollowingModel>> {
  late final UserGeneralService _service;

  @override
  Future<List<FollowingModel>> build() async {
    _service = ref.read(userGeneralServiceProvider);
    return fetchFollowing();
  }

  Future<List<FollowingModel>> fetchFollowing() async {
    state = const AsyncLoading();
    try {
      final list = await _service.getFollowingList();
      state = AsyncData(list);
      return list;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }
}
