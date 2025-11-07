import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_summary_model.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';
import 'package:flutter/material.dart';

final followingListProvider =
    AsyncNotifierProvider<FollowingListNotifier, List<UserSummaryModel>>(
      FollowingListNotifier.new,
    );

class FollowingListNotifier extends AsyncNotifier<List<UserSummaryModel>> {
  final scrollController = ScrollController();
  late final UserGeneralService _service;
  int _page = 1;
  bool _hasNext = true;
  static const int _limit = 10;
  bool _isLoading = false;
  String? _search;

  @override
  Future<List<UserSummaryModel>> build() async {
    _service = ref.read(userGeneralServiceProvider);
    _listenScroll();
    ref.onDispose(scrollController.dispose);

    return fetchFollowing(reset: true, search: _search);
  }

  void _listenScroll() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        if (_hasNext && !_isLoading) {
          _isLoading = true;
          await loadMoreFollowing();
          _isLoading = false;
        }
      }
    });
  }

  Future<List<UserSummaryModel>> fetchFollowing({
    bool reset = false,
    String? search,
  }) async {
    if (reset) {
      _page = 1;
      _hasNext = true;
      _search = search;
      state = const AsyncLoading();
    } else if (!_hasNext) {
      return state.value ?? [];
    }

    try {
      final response = await _service.getFollowingList(
        page: _page,
        limit: _limit,
        search: _search,
      );

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

  Future<void> unfollowUser(String userId, String followingId) async {
    print('unfollowUser: $userId, $followingId');
    final oldList = state.value ?? [];

    // Set user đang unfollow thành pending = true
    state = AsyncData(
      oldList.map((user) {
        if (user.id == followingId) {
          return user.copyWith(isPending: true);
        }
        return user;
      }).toList(),
    );

    final success = await _service.unfollowUser(userId, followingId);

    // Update trạng thái theo kết quả
    final updatedList = oldList.map((user) {
      if (user.id == followingId) {
        if (success) {
          // Nếu thành công, đổi trạng thái isFollowing = false và isPending = false
          return user.copyWith(isFollowing: false, isPending: false);
        } else {
          // Nếu thất bại, giữ trạng thái cũ và isPending = false
          return user.copyWith(isPending: false);
        }
      }
      return user;
    }).toList();

    state = AsyncData(updatedList);
  }


  Future<void> followUser(String userId, String followingId) async {
    print('followUser: $userId, $followingId');
    final oldList = state.value ?? [];

    // Set user đang follow thành pending = true
    state = AsyncData(
      oldList.map((user) {
        if (user.id == followingId) {
          return user.copyWith(isPending: true);
        }
        return user;
      }).toList(),
    );

    final success = await _service.followUser(userId, followingId);

    // Update trạng thái theo kết quả
    final updatedList = oldList.map((user) {
      if (user.id == followingId) {
        if (success) {
          // Nếu thành công, đổi trạng thái isFollowing = true và isPending = false
          return user.copyWith(isFollowing: true, isPending: false);
        } else {
          // Nếu thất bại, giữ trạng thái cũ và isPending = false
          return user.copyWith(isPending: false);
        }
      }
      return user;
    }).toList();

    state = AsyncData(updatedList);
  }
  Future<void> refreshFollowing() async {
    await fetchFollowing(reset: true);
  }

  Future<void> loadMoreFollowing() async {
    await fetchFollowing();
  }
}
