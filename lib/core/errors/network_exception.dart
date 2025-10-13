import 'app_exception.dart';
import 'dart:io';

class NetworkException extends AppException {
  NetworkException({required super.code, required super.message});

  factory NetworkException.fromSocket(SocketException e) {
    return NetworkException(code: 'NO_CONNECTION', message: e.message);
  }

  factory NetworkException.fromTimeout() {
    return NetworkException(code: 'TIMEOUT', message: 'Request timed out');
  }
}