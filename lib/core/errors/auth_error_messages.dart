/// Centralized authentication error messages
class AuthErrorMessages {
  // Generic errors
  static const cancelled = 'Operation was cancelled';
  static const noUser = 'No authenticated user found';
  static const networkError = 'Network error occurred';
  static const invalidInput = 'Invalid input provided';
  static const unsupportedPlatform = 'This feature is not supported on your platform';
  
  // Validation errors
  static const invalidEmail = 'Please enter a valid email address';
  static const weakPassword = 'Password is too weak';
  static const emptyPassword = 'Password cannot be empty';
  
  // Auth flow errors
  static const emailInUse = 'Email is already in use';
  static const userNotFound = 'No user found with this email';
  static const wrongPassword = 'Incorrect password';
  static const accountDisabled = 'This account has been disabled';
  static const operationNotAllowed = 'Email/password accounts are not enabled';
  static const tokenFailed = 'Failed to get authentication token';
  
  // Provider-specific errors
  static const googleSignInFailed = 'Google sign in failed';
  static const facebookSignInFailed = 'Facebook sign in failed';
  static const noIdToken = 'Failed to get ID token';
  static const noAccessToken = 'Failed to get access token';

  /// Maps Firebase auth error codes to user-friendly messages
  static String fromFirebaseCode(String code) {
    switch (code) {
      case 'invalid-email':
        return invalidEmail;
      case 'user-disabled':
        return accountDisabled;
      case 'user-not-found':
        return userNotFound;
      case 'wrong-password':
        return wrongPassword;
      case 'email-already-in-use':
        return emailInUse;
      case 'operation-not-allowed':
        return operationNotAllowed;
      case 'weak-password':
        return weakPassword;
      case 'network-request-failed':
        return networkError;
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'requires-recent-login':
        return 'Please sign in again to perform this action';
      default:
        return 'An unexpected error occurred';
    }
  }

  /// Maps custom exception codes to user-friendly messages
  static String fromExceptionCode(String code) {
    switch (code) {
      case 'CANCELLED':
        return cancelled;
      case 'NO_USER':
        return noUser;
      case 'NO_ID_TOKEN':
      case 'TOKEN_FAILED':
        return tokenFailed;
      case 'NO_ACCESS_TOKEN':
        return noAccessToken;
      case 'UNSUPPORTED_PLATFORM':
        return unsupportedPlatform;
      case 'FACEBOOK_SUCCESS':
        return facebookSignInFailed;
      default:
        return 'An unexpected error occurred';
    }
  }
}