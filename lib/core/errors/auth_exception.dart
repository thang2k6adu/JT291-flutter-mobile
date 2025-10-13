import 'app_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthException extends AppException {
  AuthException({required super.code, required super.message});

  factory AuthException.fromFirebase(FirebaseAuthException e) {
    return AuthException(
      code: e.code,
      message: e.message ?? 'Unknown auth error',
    );
  }

  factory AuthException.fromApi(Map<String, dynamic> json) {
    return AuthException(
      code: json['code']?.toString() ?? 'UNKNOWN',
      message: json['message'] ?? 'Unknown auth error',
    );
  }
}
