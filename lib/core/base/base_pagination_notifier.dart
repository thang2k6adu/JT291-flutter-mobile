// base_paginated_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';

/// Response wrapper for paginated API calls
abstract class PaginatedResponse<T> {
  List<T> get data;
  bool get hasNext;
}

/// Standard implementation of PaginatedResponse that wraps ApiResponse<PaginatedData<T>>
/// This is the standard response format from backend API
class ApiPaginatedResponse<T> implements PaginatedResponse<T> {
  final ApiResponse<PaginatedData<T>> _response;

  const ApiPaginatedResponse(this._response);

  @override
  List<T> get data {
    // Nếu có error hoặc data null, return empty list
    if (_response.error || _response.data == null) {
      return [];
    }
    return _response.data!.items;
  }

  @override
  bool get hasNext {
    // Nếu có error hoặc data null, return false
    if (_response.error || _response.data == null) {
      return false;
    }
    final meta = _response.data!.meta;
    final items = _response.data!.items;
    
    // Calculate hasNext based on current page and total pages
    // If totalPages is 0 (no meta from API), use heuristic
    if (meta.totalPages == 0) {
      // No pagination metadata from API
      // Assume there's more data if we got a full page of items
      // (i.e., items.length equals itemsPerPage limit)
      return items.length >= meta.itemsPerPage;
    }
    
    return meta.currentPage < meta.totalPages;
  }

  /// Expose error info for logging/debugging
  bool get hasError => _response.error;
  String? get errorMessage => _response.error ? _response.message : null;
}

/// Base class cho các list có phân trang, search, load more, refresh
abstract class BasePaginatedNotifier<T> extends AsyncNotifier<List<T>> {
  int _page = 1;
  bool _hasNext = true;
  bool _isLoadingMore = false;
  String? _search;

  static const int limit = 10;

  /// Concrete class cần implement: fetch 1 page từ API và trả về response với pagination
  Future<PaginatedResponse<T>> fetchPage({
    required int page,
    required int limit,
    String? search,
  });

  @override
  Future<List<T>> build() async {
    return fetchData(reset: true, search: _search);
  }

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

/// Mixin cho các notifier cần update item trong list
mixin ListItemUpdateMixin<T> on AsyncNotifier<List<T>> {
  /// Update một item trong list dựa trên id
  /// [identify] - function để identify item cần update
  /// [update] - function để update item
  void updateItem(bool Function(T item) identify, T Function(T item) update) {
    final currentList = state.value ?? [];
    final updatedList = currentList.map((item) {
      if (identify(item)) {
        return update(item);
      }
      return item;
    }).toList();

    state = AsyncData(updatedList);
  }

  /// Update item và await cho async operation, sau đó update lại theo kết quả
  Future<void> updateItemAsync(
    bool Function(T item) identify,
    T Function(T item) setPending,
    Future<bool> Function() operation,
    T Function(T item, bool success) updateResult,
  ) async {
    // 1) Lấy list hiện tại
    final initialList = state.value ?? [];

    // 2) Optimistic update: set pending
    updateItem(identify, setPending);

    // 3) Perform operation
    final success = await operation();

    // 4) Lấy lại list hiện tại sau optimistic update
    final currentList = state.value ?? [];

    // 5) Update item dựa trên list hiện tại
    final updatedList = currentList.map((item) {
      if (identify(item)) {
        return updateResult(item, success);
      }
      return item;
    }).toList();

    // 6) Set state
    state = AsyncData(updatedList);
  }
}
