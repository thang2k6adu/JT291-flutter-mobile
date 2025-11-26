import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

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
    T Function(Object?) fromJsonT, {
    String dataKey = 'items',
    String metaKey = 'meta',
  }) {
    final itemsList =
        (json[dataKey] as List<dynamic>?)?.map((e) => fromJsonT(e)).toList() ??
        [];

    final rawMeta = json[metaKey];
    final meta = (rawMeta is Map<String, dynamic>)
        ? PaginationMeta.fromJson(rawMeta)
        : PaginationMeta(); // default meta nếu không có


    return PaginatedData<T>(
      items: itemsList,
      meta: meta,
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

  // Custom safe fromJson
  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      if (v is String) return int.tryParse(v) ?? 0;
      return 0;
    }

    return PaginationMeta(
      itemCount: _toInt(json['item_count']),
      totalItems: _toInt(json['total_items']),
      itemsPerPage: _toInt(json['items_per_page']),
      totalPages: _toInt(json['total_pages']),
      currentPage: _toInt(json['current_page']),
    );
  }
}

