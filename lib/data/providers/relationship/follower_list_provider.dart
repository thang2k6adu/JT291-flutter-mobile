import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final followerListProvider =
    AsyncNotifierProvider<FollowerListNotifier, List<UserSummaryModel>>(
      FollowerListNotifier.new,
    );

class FollowerListNotifier extends AsyncNotifier<List<UserSummaryModel>> {
  final scrollController = ScrollController();
  late final UserGeneralService _service;
  bool _isLoading = false;

  int _page = 1;
  bool _hasNext = true;
  static const int _limit = 10;

  @override
  Future<List<UserSummaryModel>> build() async {
    _service = ref.read(userGeneralServiceProvider);
    _listenScroll();
    ref.onDispose(scrollController.dispose);

    return fetchFollower(reset: true);
  }

void _listenScroll() {
  scrollController.addListener(() async {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (_hasNext && !_isLoading) {
        _isLoading = true;
        await loadMoreFollower();
        _isLoading = false;
      }
    }
  });
}
  /// Fetch follower list (có hỗ trợ reset & load more)
  Future<List<UserSummaryModel>> fetchFollower({bool reset = false}) async {
    print('fetchFollower: $reset');
    if (reset) {
      _page = 1;
      _hasNext = true;
      state = const AsyncLoading();
    } else if (!_hasNext) {
      // Nếu không còn trang kế -> return luôn data hiện có
      return state.value ?? [];
    }

    try {
      final response = await _service.getFollowerList(
        page: _page,
        limit: _limit,
      );

      final newData = response?.data ?? <UserSummaryModel>[];
      final pagination = response?.pagination;
      _hasNext = pagination?.hasNext ?? false;
      if (_hasNext && !_isLoading) _page++;

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

  /// Làm mới dữ liệu
  Future<void> refreshFollower() => fetchFollower(reset: true);

  /// Tải thêm khi scroll
  Future<void> loadMoreFollower() => fetchFollower();

  bool get isLoading => _isLoading;
}
