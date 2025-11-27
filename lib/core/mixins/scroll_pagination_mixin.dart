import 'package:flutter/material.dart';

/// Mixin để handle scroll pagination cho các StatefulWidget
/// 
/// Usage:
/// ```dart
/// class _MyListState extends State<MyList> with ScrollPaginationMixin {
///   @override
///   Future<void> Function() get onLoadMore => () async {
///     await ref.read(myProvider.notifier).loadMore();
///   }
///   
///   @override
///   bool Function() get hasNext => () => ref.read(myProvider.notifier).hasNext;
///   
///   @override
///   bool Function() get isLoadingMore => () => ref.read(myProvider.notifier).isLoadingMore;
/// }
/// ```
mixin ScrollPaginationMixin<T extends StatefulWidget> on State<T> {
  ScrollController? _scrollController;
  bool _isCheckingFullScreen = false;
  
  /// Callback để load more data khi scroll gần cuối
  Future<void> Function() get onLoadMore;
  
  /// Check xem còn data để load không
  /// Default: true (luôn cho phép load more nếu không override)
  bool Function() get hasNext => () => true;
  
  /// Check xem đang loading more không
  /// Default: false (không check loading state nếu không override)
  bool Function() get isLoadingMore => () => false;
  
  /// Threshold (pixels) để trigger load more khi scroll gần cuối
  /// Default: 200
  double get scrollThreshold => 200;
  
  /// ScrollController được quản lý bởi mixin
  ScrollController get scrollController {
    _scrollController ??= ScrollController();
    return _scrollController!;
  }
  
  @override
  void initState() {
    super.initState();
    _setupScrollListener();
  }
  
  @override
  void dispose() {
    _scrollController?.removeListener(_onScroll);
    _scrollController?.dispose();
    super.dispose();
  }
  
  /// Setup scroll listener
  void _setupScrollListener() {
    scrollController.addListener(_onScroll);
  }
  
  /// Handle scroll event - trigger loadMore khi gần cuối
  void _onScroll() {
    if (!scrollController.hasClients) return;
    
    final position = scrollController.position;
    if (position.pixels >= position.maxScrollExtent - scrollThreshold) {
      if (hasNext() && !isLoadingMore()) {
        onLoadMore();
      }
    }
  }
  
  /// Check và load more nếu list chưa đầy màn hình
  /// Nên gọi sau khi:
  /// - Initial load complete
  /// - Refresh complete
  /// - Sau khi data thay đổi
  void checkLoadMoreIfListNotFull() {
    if (_isCheckingFullScreen) return;
    _isCheckingFullScreen = true;
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _isCheckingFullScreen = false;
      if (!scrollController.hasClients) return;
      
      final position = scrollController.position;
      if (position.maxScrollExtent <= position.viewportDimension) {
        // List chưa đầy màn hình
        if (hasNext() && !isLoadingMore()) {
          onLoadMore().then((_) {
            // Recursive check sau khi load xong
            checkLoadMoreIfListNotFull();
          });
        }
      }
    });
  }
  
  /// Remove scroll listener (nếu cần tạm thời disable)
  void removeScrollListener() {
    _scrollController?.removeListener(_onScroll);
  }
  
  /// Add scroll listener lại (sau khi remove)
  void addScrollListener() {
    _scrollController?.addListener(_onScroll);
  }
}

