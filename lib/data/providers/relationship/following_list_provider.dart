import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final followingListProvider =
    AsyncNotifierProvider<FollowingListNotifier, List<UserSummaryModel>>(
  () => FollowingListNotifier(),
);

class FollowingListNotifier extends AsyncNotifier<List<UserSummaryModel>> {
  late final UserGeneralService _service;
  int _page = 1;
  bool _hasNext = true;
  static const int _limit = 10;

  @override
  Future<List<UserSummaryModel>> build() async {
    _service = ref.read(userGeneralServiceProvider);
    return fetchFollowing(reset: true);
  }

  Future<List<UserSummaryModel>> fetchFollowing({bool reset = false}) async {
    if (reset) {
      _page = 1;
      _hasNext = true;
      state = const AsyncLoading();
    } else if (!_hasNext) {
      return state.value ?? [];
    }

    try {
      final response =
          await _service.getFollowingList(page: _page, limit: _limit);

      final newData = response?.data ?? [];
      final pagination = response?.pagination;

      _hasNext = pagination?.hasNext ?? false;
      if (_hasNext) _page++;

      final updatedList = <UserSummaryModel>[
        if (!reset) ...(state.value ?? []),
        ...newData,
      ];

      state = AsyncData(updatedList);
      return updatedList;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }

  Future<void> refreshFollowing() async {
    await fetchFollowing(reset: true);
  }

  Future<void> loadMoreFollowing() async {
    await fetchFollowing();
  }
}
