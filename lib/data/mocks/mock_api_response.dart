import 'package:jt291_flutter_mobile/data/models/base/api_response.dart';

/// Helper để tạo mock ApiResponse thành công
ApiResponse<T> mockSuccessResponse<T>(T data, {String message = 'Success'}) {
  return ApiResponse<T>(
    error: false,
    code: 200,
    message: message,
    data: data,
    traceId: 'mock_trace_${DateTime.now().millisecondsSinceEpoch}',
  );
}

/// Helper để tạo mock ApiResponse lỗi
ApiResponse<T> mockErrorResponse<T>({
  required String message,
  int code = 400,
  T? data,
}) {
  return ApiResponse<T>(
    error: true,
    code: code,
    message: message,
    data: data,
    traceId: 'mock_trace_${DateTime.now().millisecondsSinceEpoch}',
  );
}

/// Helper để tạo mock PaginatedData
PaginatedData<T> mockPaginatedData<T>({
  required List<T> items,
  required int currentPage,
  required int itemsPerPage,
  required int totalItems,
}) {
  final totalPages = (totalItems / itemsPerPage).ceil();
  
  return PaginatedData<T>(
    items: items,
    meta: PaginationMeta(
      itemCount: items.length,
      totalItems: totalItems,
      itemsPerPage: itemsPerPage,
      totalPages: totalPages,
      currentPage: currentPage,
    ),
  );
}

/// Helper để tạo mock ApiResponse với PaginatedData
ApiResponse<PaginatedData<T>> mockPaginatedResponse<T>({
  required List<T> items,
  required int currentPage,
  required int itemsPerPage,
  required int totalItems,
  String message = 'Success',
}) {
  final paginatedData = mockPaginatedData<T>(
    items: items,
    currentPage: currentPage,
    itemsPerPage: itemsPerPage,
    totalItems: totalItems,
  );

  return mockSuccessResponse(paginatedData, message: message);
}

