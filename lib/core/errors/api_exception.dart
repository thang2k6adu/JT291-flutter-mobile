// lib/core/errors/api_exception.dart
import 'app_exception.dart';

class ApiException extends AppException {
  ApiException({required super.code, required super.message});

  factory ApiException.fromJson(Map<String, dynamic> json) {
    return ApiException(
      code: json['code']?.toString() ?? 'UNKNOWN',
      message: json['message'] ?? 'Unknown API error',
    );
  }
}
