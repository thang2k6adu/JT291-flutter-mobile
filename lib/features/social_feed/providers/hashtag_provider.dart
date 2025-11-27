import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/social/hashtag_model.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_model.dart';
import 'package:jt291_flutter_mobile/data/services/social_feed_service.dart';

/// Provider for hashtag detail by ID
final hashtagDetailProvider = FutureProvider.family<HashtagDetailModel, String>(
  (ref, hashtagId) async {
    final service = ref.read(socialFeedServiceProvider);
    final response = await service.getHashtagDetail(hashtagId);
    
    if (response.error || response.data == null) {
      throw Exception(response.message);
    }
    
    return response.data!;
  },
);

/// Provider for hashtag posts with pagination
final hashtagPostsProvider = AsyncNotifierProvider.family<
    HashtagPostsNotifier,
    List<PostModel>,
    HashtagPostsParams
>(HashtagPostsNotifier.new);

/// Parameters for hashtag posts provider
class HashtagPostsParams {
  final String hashtagId;
  final String sort; // "popular" or "latest"

  HashtagPostsParams({
    required this.hashtagId,
    this.sort = 'latest',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HashtagPostsParams &&
          runtimeType == other.runtimeType &&
          hashtagId == other.hashtagId &&
          sort == other.sort;

  @override
  int get hashCode => hashtagId.hashCode ^ sort.hashCode;
}

class HashtagPostsNotifier extends FamilyAsyncNotifier<List<PostModel>, HashtagPostsParams> {
  late final SocialFeedService _service;
  late final HashtagPostsParams _params;
  
  int _page = 1;
  bool _hasNext = true;
  bool _isLoadingMore = false;

  static const int limit = 10;

  @override
  Future<List<PostModel>> build(HashtagPostsParams params) async {
    _service = ref.read(socialFeedServiceProvider);
    _params = params;
    return fetchData(reset: true);
  }

  Future<PaginatedResponse<PostModel>> fetchPage({
    required int page,
    required int limit,
  }) async {
    final response = await _service.getPostsByHashtag(
      hashtagId: _params.hashtagId,
      page: page,
      limit: limit,
      sort: _params.sort,
    );
    return ApiPaginatedResponse(response);
  }

  /// Fetch dữ liệu (có handle reset, pagination)
  Future<List<PostModel>> fetchData({bool reset = false}) async {
    if (_isLoadingMore && !reset) return state.value ?? [];

    if (reset) {
      _page = 1;
      _hasNext = true;
      state = const AsyncLoading();
    } else if (!_hasNext) {
      return state.value ?? [];
    }

    if (!reset) _isLoadingMore = true;

    try {
      final response = await fetchPage(
        page: _page,
        limit: limit,
      );

      final newData = response.data;
      _hasNext = response.hasNext;
      if (_hasNext) _page++;

      // Kết hợp với list hiện tại
      final updatedList = <PostModel>[if (!reset) ...(state.value ?? []), ...newData];

      state = AsyncData(updatedList);
      return updatedList;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    } finally {
      _isLoadingMore = false;
    }
  }

  /// Load thêm page kế tiếp
  Future<void> loadMore() async {
    if (!_hasNext || _isLoadingMore) return;
    await fetchData();
  }

  /// Refresh toàn bộ dữ liệu
  Future<void> refresh() async {
    await fetchData(reset: true);
  }

  // --- Getters ---
  bool get isLoadingMore => _isLoadingMore;
  bool get hasNext => _hasNext;
  int get currentPage => _page;
}

