import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/friend_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final friendListProvider =
    AsyncNotifierProvider<FriendListNotifier, List<FriendModel>>(
  () => FriendListNotifier(),
);

class FriendListNotifier extends AsyncNotifier<List<FriendModel>> {
  late final UserGeneralService _service;

  @override
  Future<List<FriendModel>> build() async {
    _service = ref.read(userGeneralServiceProvider);
    return fetchFriend();
  }

  Future<List<FriendModel>> fetchFriend() async {
    state = const AsyncLoading();
    try {
      final list = await _service.getFriendList();
      state = AsyncData(list);
      return list;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }
}