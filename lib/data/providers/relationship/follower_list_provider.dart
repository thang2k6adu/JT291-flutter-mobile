import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final followerListProvider =
    AsyncNotifierProvider<FollowerListNotifier, List<UserSummaryModel>>(
      () => FollowerListNotifier(),
    );

class FollowerListNotifier extends AsyncNotifier<List<UserSummaryModel>> {
  late final UserGeneralService _service;
  int _page = 1;
  bool _hasNext = true;
  static const int _limit = 10;

  @override
  Future<List<UserSummaryModel>> build() async {
    _service = ref.read(userGeneralServiceProvider);
    return fetchFollower(reset: true);
  }

  /// Fetch follower list (có hỗ trợ reset & load more)
  Future<List<UserSummaryModel>> fetchFollower({bool reset = false}) async {
    if (reset) {
      _page = 1;
      _hasNext = true;
      state = const AsyncLoading();
    } else if (!_hasNext) {
      return state.value ?? [];
    }

    try {
      final response = await _service.getFollowerList(
        page: _page,
        limit: _limit,
      );

      final newData = response?.data ?? [];
      final pagination = response?.pagination;

      _hasNext = pagination?.hasNext ?? false;
      if (_hasNext) _page++;

      // Gộp data cũ + mới
      final updatedList = <UserSummaryModel>[if (!reset) ...(state.value ?? []), ...newData];

      state = AsyncData(updatedList);
      return updatedList;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }

  /// Làm mới dữ liệu
  Future<void> refreshFollower() async {
    await fetchFollower(reset: true);
  }

  /// Tải thêm khi scroll
  Future<void> loadMoreFollower() async {
    await fetchFollower();
  }
}
