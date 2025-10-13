// lib/core/errors/app_exception.dart
abstract class AppException implements Exception {
  final String code;
  final String message;

  AppException({required this.code, required this.message});

  @override
  String toString() => 'AppException($code): $message';
}
