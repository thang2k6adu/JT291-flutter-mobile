import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/base/base_pagination_notifier.dart';
import 'package:jt291_flutter_mobile/data/models/gift/gift_model.dart';
import 'package:jt291_flutter_mobile/data/services/gift_service.dart';

/// Family Provider để quản lý gifts cho từng category riêng biệt
/// Mỗi category sẽ có cache riêng, không fetch lại khi switch tab
final giftByCategoryProvider = AsyncNotifierProvider.family<GiftCategoryNotifier, List<GiftModel>, String>(
  GiftCategoryNotifier.new,
);

/// Notifier xử lý gifts cho một category cụ thể
class GiftCategoryNotifier extends FamilyAsyncNotifier<List<GiftModel>, String> 
    with BasePaginationMixin<GiftModel> {
  late final GiftService _service;
  late final String _category;

  @override
  Future<List<GiftModel>> build(String category) async {
    _service = ref.read(giftServiceProvider);
    _category = category;
    print('GiftCategoryNotifier.build: category=$category');
    return fetchData(reset: true);
  }

  @override
  Future<PaginatedResponse<GiftModel>> fetchPage({
    required int page,
    required int limit,
    String? search,
  }) async {
    print('GiftCategoryNotifier.fetchPage: category=$_category, page=$page, limit=$limit');

    final apiResponse = await _service.getGifts(
      category: _category,
      page: page,
      limit: limit,
    );

    print('Gift apiResponse (provider): ${apiResponse?.message}');

    // Wrap bằng ApiPaginatedResponse chuẩn từ base class
    final giftResponse = ApiPaginatedResponse<GiftModel>(apiResponse!);

    // Log error nếu có
    if (giftResponse.hasError) {
      print('Get gifts error: ${giftResponse.errorMessage}');
    }

    return giftResponse;
  }

  /// Get current category
  String get currentCategory => _category;
}

/// Mixin để implement pagination cho Family notifier
mixin BasePaginationMixin<T> on FamilyAsyncNotifier<List<T>, String> {
  int _page = 1;
  bool _hasNext = true;
  bool _isLoadingMore = false;
  String? _search;

  static const int limit = 10;

  /// Abstract method to fetch page - must be implemented by notifier
  Future<PaginatedResponse<T>> fetchPage({
    required int page,
    required int limit,
    String? search,
  });

  /// Fetch dữ liệu (có handle reset, pagination)
  Future<List<T>> fetchData({bool reset = false, String? search}) async {
    if (_isLoadingMore && !reset) return state.value ?? [];

    if (reset) {
      _page = 1;
      _hasNext = true;
      _search = search;
      state = const AsyncLoading();
    } else if (!_hasNext) {
      return state.value ?? [];
    }

    if (!reset) _isLoadingMore = true;

    try {
      final response = await fetchPage(
        page: _page,
        limit: limit,
        search: _search,
      );

      final newData = response.data;
      _hasNext = response.hasNext;
      if (_hasNext) _page++;

      // Kết hợp với list hiện tại
      final updatedList = <T>[if (!reset) ...(state.value ?? []), ...newData];

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
  String? get searchQuery => _search;
}

