import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/profile_view_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/viewer_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/pagination_model.dart';
import 'package:jt291_flutter_mobile/data/providers/user_general/user_general_provider.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

final profileViewProvider = AsyncNotifierProvider<ProfileViewNotifier, ProfileViewModel?>(
  ProfileViewNotifier.new,
);

class ProfileViewNotifier extends AsyncNotifier<ProfileViewModel?> {
  final scrollController = ScrollController();
  late final UserGeneralService _service;
  bool _isLoading = false;
  String? _userId;
  int _page = 1;
  bool _hasNext = true;
  static const int _limit = 10;

  @override
  Future<ProfileViewModel?> build() async {
    _service = ref.read(userGeneralServiceProvider);
    _userId = ref.watch(userGeneralProvider).value?.unionId;
    _listenScroll();
    ref.onDispose(scrollController.dispose);

    return fetchProfileViews(reset: true);
  }

  // Lắng nghe sự kiện scroll và load thêm dữ liệu khi cuộn đến cuối
  void _listenScroll() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        if (_hasNext && !_isLoading) {
          _isLoading = true;
          await loadMoreProfileViews();
          _isLoading = false;
        }
      }
    });
  }

  /// Fetch profile views (có hỗ trợ reset và load thêm)
  Future<ProfileViewModel?> fetchProfileViews({bool reset = false}) async {
    print('fetchProfileViews: $reset');
    if (reset) {
      _page = 1;
      _hasNext = true;
      state = const AsyncLoading();
    } else if (!_hasNext) {
      // Nếu không còn trang kế -> return luôn data hiện có
      return state.value;
    }

    try {

      if (_userId == null) {
        state = AsyncError('User ID is null', StackTrace.current);
        return null;
      }

      final response = await _service.getProfileViews(
        _userId!,
        page: _page,
        limit: _limit,
      );

      final newData = response?.views ?? [];
      final pagination = response?.pagination;
      _hasNext = pagination?.hasNext ?? false;

      if (_hasNext && !_isLoading) _page++;

      final updatedList = <ViewerModel>[
        if (!reset) ...(state.value?.views ?? []),
        ...newData,
      ];

      // Cập nhật lại state với dữ liệu mới
      state = AsyncData(ProfileViewModel(
        userId: _userId!,
        canViewFull: response?.canViewFull ?? false,
        total: response?.total ?? 0,
        views: updatedList,
        pagination: pagination ?? PaginationModel(
          offset: _page,
          limit: _limit,
          total: 0,
          hasNext: false,
        ),
      ));
      return state.value;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  /// Làm mới dữ liệu
  Future<void> refreshProfileViews() => fetchProfileViews(reset: true);

  /// Tải thêm khi scroll
  Future<void> loadMoreProfileViews() => fetchProfileViews();

  bool get isLoading => _isLoading;
}