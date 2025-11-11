import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// Base API Response wrapper
/// Generic type T represents the data payload
@freezed
abstract class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    @Default(false) bool error,
    @Default(0) int code,
    @Default('Success') String message,
    T? data,
    String? traceId,
  }) = _ApiResponse<T>;

  /// Custom fromJson that handles generic type T
  /// Usage: ApiResponse.fromJson(json, (data) => YourModel.fromJson(data as Map<String, dynamic>))
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return ApiResponse<T>(
      error: json['error'] as bool? ?? false,
      code: json['code'] as int? ?? 0,
      message: json['message'] as String? ?? 'Success',
      data: json['data'] == null ? null : fromJsonT(json['data']),
      traceId: json['traceId'] as String?,
    );
  }
}

/// Paginated data wrapper - used inside ApiResponse
/// Matches structure: { "items": [...], "meta": {...} }
@freezed
abstract class PaginatedData<T> with _$PaginatedData<T> {
  const factory PaginatedData({
    @Default([]) List<T> items,
    required PaginationMeta meta,
  }) = _PaginatedData<T>;

  /// Custom fromJson that handles generic type T for items
  /// Usage: PaginatedData.fromJson(json, (item) => YourModel.fromJson(item as Map<String, dynamic>))
  factory PaginatedData.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    final itemsList = (json['items'] as List<dynamic>?)
            ?.map((e) => fromJsonT(e))
            .toList() ??
        [];
    
    return PaginatedData<T>(
      items: itemsList,
      meta: PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }
}

/// Pagination metadata - matches backend "meta" structure
@freezed
abstract class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    @Default(0) @JsonKey(name: 'item_count') int itemCount,
    @Default(0) @JsonKey(name: 'total_items') int totalItems,
    @Default(10) @JsonKey(name: 'items_per_page') int itemsPerPage,
    @Default(0) @JsonKey(name: 'total_pages') int totalPages,
    @Default(1) @JsonKey(name: 'current_page') int currentPage,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

