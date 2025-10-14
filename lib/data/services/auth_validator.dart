import 'package:flutter_boilerplate/core/errors/auth_exception.dart';

class AuthValidator {
  static void validateEmail(String email) {
    if (email.isEmpty) {
      throw AuthException(
        code: 'EMPTY_EMAIL', 
        message: 'Email cannot be empty'
      );
    }
    
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw AuthException(
        code: 'INVALID_EMAIL', 
        message: 'Invalid email format'
      );
    }
  }
  
  static void validatePassword(String password) {
    if (password.isEmpty) {
      throw AuthException(
        code: 'EMPTY_PASSWORD', 
        message: 'Password cannot be empty'
      );
    }
    
    if (password.length < 6) {
      throw AuthException(
        code: 'WEAK_PASSWORD', 
        message: 'Password must be at least 6 characters'
      );
    }
  }

  // CÓ THỂ THÊM advanced validation
  static void validateStrongPassword(String password) {
    validatePassword(password);
    
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      throw AuthException(
        code: 'NO_UPPERCASE',
        message: 'Password must contain at least one uppercase letter',
      );
    }
    
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      throw AuthException(
        code: 'NO_LOWERCASE', 
        message: 'Password must contain at least one lowercase letter'
      );
    }
    
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      throw AuthException(
        code: 'NO_NUMBER',
        message: 'Password must contain at least one number',
      );
    }
  }
}