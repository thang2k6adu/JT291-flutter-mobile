import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/follower_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final followerListProvider =
    AsyncNotifierProvider<FollowerListNotifier, List<FollowerModel>>(
  () => FollowerListNotifier(),
);

class FollowerListNotifier extends AsyncNotifier<List<FollowerModel>> {
  late final UserGeneralService _service;

  @override
  Future<List<FollowerModel>> build() async {
    _service = ref.read(userGeneralServiceProvider);
    return fetchFollower();
  }

  Future<List<FollowerModel>> fetchFollower() async {
    state = const AsyncLoading();
    try {
      final list = await _service.getFollowerList();
      state = AsyncData(list);
      return list;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }
}