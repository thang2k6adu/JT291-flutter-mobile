/// Base exception class cho toàn bộ app
abstract class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic details;

  AppException({
    required this.message,
    this.code,
    this.details,
  });

  @override
  String toString() => message;
}

// ==================== NETWORK EXCEPTIONS ====================

/// Exception chung cho các lỗi network
class NetworkException extends AppException {
  NetworkException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Không có kết nối internet
class NoInternetException extends NetworkException {
  NoInternetException()
      : super(
          message: 'Không có kết nối internet. Vui lòng kiểm tra lại.',
          code: 'NO_INTERNET',
        );
}

/// Request timeout
class TimeoutException extends NetworkException {
  TimeoutException()
      : super(
          message: 'Yêu cầu quá thời gian chờ. Vui lòng thử lại.',
          code: 'TIMEOUT',
        );
}

/// Server không phản hồi
class ServerException extends NetworkException {
  ServerException({String? message})
      : super(
          message: message ?? 'Lỗi máy chủ. Vui lòng thử lại sau.',
          code: 'SERVER_ERROR',
        );
}

/// Bad request (400)
class BadRequestException extends NetworkException {
  BadRequestException({String? message})
      : super(
          message: message ?? 'Yêu cầu không hợp lệ.',
          code: 'BAD_REQUEST',
        );
}

/// Not found (404)
class NotFoundException extends NetworkException {
  NotFoundException({String? message})
      : super(
          message: message ?? 'Không tìm thấy dữ liệu.',
          code: 'NOT_FOUND',
        );
}

/// Service unavailable (503)
class ServiceUnavailableException extends NetworkException {
  ServiceUnavailableException()
      : super(
          message: 'Dịch vụ tạm thời không khả dụng. Vui lòng thử lại sau.',
          code: 'SERVICE_UNAVAILABLE',
        );
}

// ==================== AUTHENTICATION EXCEPTIONS ====================

/// Exception chung cho authentication
class AuthException extends AppException {
  AuthException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Chưa đăng nhập
class UnauthorizedException extends AuthException {
  UnauthorizedException()
      : super(
          message: 'Vui lòng đăng nhập để tiếp tục.',
          code: 'UNAUTHORIZED',
        );
}

/// Không có quyền truy cập
class ForbiddenException extends AuthException {
  ForbiddenException()
      : super(
          message: 'Bạn không có quyền truy cập tài nguyên này.',
          code: 'FORBIDDEN',
        );
}

/// Token hết hạn
class TokenExpiredException extends AuthException {
  TokenExpiredException()
      : super(
          message: 'Phiên đăng nhập đã hết hạn. Vui lòng đăng nhập lại.',
          code: 'TOKEN_EXPIRED',
        );
}

/// Thông tin đăng nhập không hợp lệ
class InvalidCredentialsException extends AuthException {
  InvalidCredentialsException()
      : super(
          message: 'Email hoặc mật khẩu không chính xác.',
          code: 'INVALID_CREDENTIALS',
        );
}

/// Email đã tồn tại
class EmailAlreadyExistsException extends AuthException {
  EmailAlreadyExistsException()
      : super(
          message: 'Email này đã được sử dụng.',
          code: 'EMAIL_EXISTS',
        );
}

/// Tài khoản bị khóa
class AccountLockedException extends AuthException {
  AccountLockedException()
      : super(
          message: 'Tài khoản của bạn đã bị khóa. Vui lòng liên hệ hỗ trợ.',
          code: 'ACCOUNT_LOCKED',
        );
}

// ==================== VALIDATION EXCEPTIONS ====================

/// Exception cho validation errors
class ValidationException extends AppException {
  final Map<String, List<String>>? errors;

  ValidationException({
    String? message,
    this.errors,
  }) : super(
          message: message ?? 'Dữ liệu không hợp lệ.',
          code: 'VALIDATION_ERROR',
          details: errors,
        );
}

/// Field bắt buộc bị thiếu
class RequiredFieldException extends ValidationException {
  RequiredFieldException(String fieldName)
      : super(
          message: '$fieldName là bắt buộc.',
          errors: {
            fieldName: ['Trường này là bắt buộc']
          },
        );
}

/// Format không đúng
class InvalidFormatException extends ValidationException {
  InvalidFormatException(String fieldName, {String? format})
      : super(
          message: format != null
              ? '$fieldName phải có định dạng $format.'
              : '$fieldName không đúng định dạng.',
        );
}

// ==================== DATABASE EXCEPTIONS ====================

/// Exception chung cho database
class DatabaseException extends AppException {
  DatabaseException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Không tìm thấy dữ liệu trong database
class DataNotFoundException extends DatabaseException {
  DataNotFoundException({String? entity})
      : super(
          message: entity != null
              ? 'Không tìm thấy $entity.'
              : 'Không tìm thấy dữ liệu.',
          code: 'DATA_NOT_FOUND',
        );
}

/// Lỗi khi lưu dữ liệu
class DataSaveException extends DatabaseException {
  DataSaveException()
      : super(
          message: 'Không thể lưu dữ liệu. Vui lòng thử lại.',
          code: 'DATA_SAVE_ERROR',
        );
}

/// Duplicate entry
class DuplicateEntryException extends DatabaseException {
  DuplicateEntryException({String? entity})
      : super(
          message: entity != null
              ? '$entity đã tồn tại.'
              : 'Dữ liệu đã tồn tại.',
          code: 'DUPLICATE_ENTRY',
        );
}

// ==================== FILE EXCEPTIONS ====================

/// Exception cho file operations
class FileException extends AppException {
  FileException({
    required super.message,
    super.code,
    super.details,
  });
}

/// File không tồn tại
class FileNotFoundException extends FileException {
  FileNotFoundException()
      : super(
          message: 'Không tìm thấy file.',
          code: 'FILE_NOT_FOUND',
        );
}

/// File quá lớn
class FileSizeException extends FileException {
  final int maxSizeInMB;

  FileSizeException(this.maxSizeInMB)
      : super(
          message: 'File quá lớn. Kích thước tối đa là ${maxSizeInMB}MB.',
          code: 'FILE_TOO_LARGE',
        );
}

/// Format file không được hỗ trợ
class UnsupportedFileTypeException extends FileException {
  UnsupportedFileTypeException({List<String>? supportedTypes})
      : super(
          message: supportedTypes != null
              ? 'File không được hỗ trợ. Chỉ chấp nhận: ${supportedTypes.join(", ")}.'
              : 'Định dạng file không được hỗ trợ.',
          code: 'UNSUPPORTED_FILE_TYPE',
        );
}

// ==================== PERMISSION EXCEPTIONS ====================

/// Exception cho permissions
class PermissionException extends AppException {
  PermissionException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Camera permission denied
class CameraPermissionException extends PermissionException {
  CameraPermissionException()
      : super(
          message: 'Cần cấp quyền truy cập camera.',
          code: 'CAMERA_PERMISSION_DENIED',
        );
}

/// Storage permission denied
class StoragePermissionException extends PermissionException {
  StoragePermissionException()
      : super(
          message: 'Cần cấp quyền truy cập bộ nhớ.',
          code: 'STORAGE_PERMISSION_DENIED',
        );
}

/// Location permission denied
class LocationPermissionException extends PermissionException {
  LocationPermissionException()
      : super(
          message: 'Cần cấp quyền truy cập vị trí.',
          code: 'LOCATION_PERMISSION_DENIED',
        );
}

// ==================== PAYMENT EXCEPTIONS ====================

/// Exception cho payment
class PaymentException extends AppException {
  PaymentException({
    required super.message,
    super.code,
    super.details,
  });
}

/// Payment failed
class PaymentFailedException extends PaymentException {
  PaymentFailedException({String? reason})
      : super(
          message: reason ?? 'Thanh toán thất bại. Vui lòng thử lại.',
          code: 'PAYMENT_FAILED',
        );
}

/// Payment cancelled
class PaymentCancelledException extends PaymentException {
  PaymentCancelledException()
      : super(
          message: 'Thanh toán đã bị hủy.',
          code: 'PAYMENT_CANCELLED',
        );
}

/// Insufficient funds
class InsufficientFundsException extends PaymentException {
  InsufficientFundsException()
      : super(
          message: 'Số dư không đủ để thực hiện giao dịch.',
          code: 'INSUFFICIENT_FUNDS',
        );
}

// ==================== GENERAL EXCEPTIONS ====================

/// Exception chung cho các lỗi không xác định
class UnknownException extends AppException {
  UnknownException({String? message})
      : super(
          message: message ?? 'Đã xảy ra lỗi không xác định.',
          code: 'UNKNOWN_ERROR',
        );
}

/// Feature chưa được triển khai
class NotImplementedException extends AppException {
  NotImplementedException()
      : super(
          message: 'Tính năng này chưa được triển khai.',
          code: 'NOT_IMPLEMENTED',
        );
}

/// Cache exception
class CacheException extends AppException {
  CacheException()
      : super(
          message: 'Lỗi khi truy cập bộ nhớ đệm.',
          code: 'CACHE_ERROR',
        );
}

// ==================== EXCEPTION HANDLER ====================

/// Helper class để parse exception từ HTTP status code
class ExceptionHandler {
  static AppException fromStatusCode(int statusCode, {String? message}) {
    switch (statusCode) {
      case 400:
        return BadRequestException(message: message);
      case 401:
        return UnauthorizedException();
      case 403:
        return ForbiddenException();
      case 404:
        return NotFoundException(message: message);
      case 503:
        return ServiceUnavailableException();
      case 500:
      case 502:
      case 504:
        return ServerException(message: message);
      default:
        return UnknownException(message: message);
    }
  }

  /// Parse exception và trả về message phù hợp
  static String getErrorMessage(dynamic error) {
    if (error is AppException) {
      return error.message;
    }
    return 'Đã xảy ra lỗi không xác định.';
  }
}