import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:io';
import 'package:flutter_boilerplate/core/utils/wrapper.dart';
import 'package:flutter_boilerplate/core/errors/auth_exception.dart';
import 'auth_service.dart';
import 'auth_validator.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  static const Duration _minRetryDelay = Duration(seconds: 2);
  DateTime? _lastAuthAttempt;

  FirebaseAuthService({
    FirebaseAuth? auth,
    GoogleSignIn? googleSignIn,
    FacebookAuth? facebookAuth,
  }) : _auth = auth ?? FirebaseAuth.instance,
       _googleSignIn =
           googleSignIn ?? GoogleSignIn.standard(), // Dùng standard()
       _facebookAuth = facebookAuth ?? FacebookAuth.instance;

  Future<void> _checkRateLimit() async {
    if (_lastAuthAttempt != null) {
      final timeSinceLastAttempt = DateTime.now().difference(_lastAuthAttempt!);
      if (timeSinceLastAttempt < _minRetryDelay) {
        throw AuthException(
          code: 'RATE_LIMITED',
          message: 'Please wait before attempting again',
        );
      }
    }
    _lastAuthAttempt = DateTime.now();
  }

  @override
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  @override
  Future<String?> signInWithEmail(String email, String password) {
    return handleService(
      action: () async {
        await _checkRateLimit();

        AuthValidator.validateEmail(email);
        AuthValidator.validatePassword(password);

        final userCredential = await _auth.signInWithEmailAndPassword(
          email: email.trim(),
          password: password,
        );

        return await userCredential.user?.getIdToken(true);
      },
      serviceName: 'FirebaseAuthService.signInWithEmail', // THÊM service name
    );
  }

  @override
  Future<String?> registerWithEmail(String email, String password) {
    return handleService(
      action: () async {
        AuthValidator.validateEmail(email);
        AuthValidator.validatePassword(password);

        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), // THÊM trim()
          password: password,
        );

        // Tự động gửi email verification khi đăng ký
        await userCredential.user?.sendEmailVerification();

        return await userCredential.user?.getIdToken(true);
      },
      serviceName: 'FirebaseAuthService.registerWithEmail',
    );
  }

  @override
  Future<void> signOut() {
    return handleService(
      action: () async {
        await _googleSignIn.signOut(); // Đăng xuất Google
        await _facebookAuth.logOut(); // Đăng xuất Facebook
        await _auth.signOut(); // Đăng xuất Firebase
      },
      serviceName: 'FirebaseAuthService.signOut',
    );
  }

  @override
  Future<String?> signInWithGoogle() {
    return handleService(
      action: () async {
        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          throw AuthException(
            code: 'CANCELLED', // Đổi code cho consistent
            message: 'Google sign in cancelled',
          );
        }

        final googleAuth = await googleUser.authentication;

        // Validate tokens
        if (googleAuth.idToken == null) {
          throw AuthException(
            code: 'NO_ID_TOKEN',
            message: 'Failed to get ID token from Google',
          );
        }

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        final result = await _auth.signInWithCredential(credential);
        final idToken = await result.user?.getIdToken(true);

        if (idToken == null) {
          throw AuthException(
            code: 'TOKEN_FAILED', // Đổi code cho consistent
            message: 'Failed to get ID token after sign in',
          );
        }

        return idToken;
      },
      serviceName: 'FirebaseAuthService.signInWithGoogle',
    );
  }

  @override
  Future<String?> signInWithFacebook() {
    return handleService(
      action: () async {
        if (!Platform.isAndroid && !Platform.isIOS) {
          throw AuthException(
            code: 'UNSUPPORTED_PLATFORM',
            message: 'Facebook Auth only supports Android and iOS',
          );
        }

        final result = await _facebookAuth.login();
        if (result.status != LoginStatus.success) {
          throw AuthException(
            code: 'FACEBOOK_${result.status.name}',
            message: 'Facebook login failed: ${result.status}',
          );
        }

        if (result.accessToken == null) {
          throw AuthException(
            code: 'NO_ACCESS_TOKEN',
            message: 'Failed to get access token from Facebook',
          );
        }

        final credential = FacebookAuthProvider.credential(
          result.accessToken!.token,
        );

        final userCredential = await _auth.signInWithCredential(credential);
        final idToken = await userCredential.user?.getIdToken(true);

        if (idToken == null) {
          throw AuthException(
            code: 'TOKEN_FAILED',
            message: 'Failed to get ID token after Facebook sign in',
          );
        }

        return idToken;
      },
      serviceName: 'FirebaseAuthService.signInWithFacebook',
    );
  }

  @override
  User? currentUser() => _auth.currentUser;

  @override
  Future<String?> getIdToken({bool forceRefresh = false}) {
    return handleService(
      action: () async {
        final user = _auth.currentUser;
        if (user == null) {
          throw AuthException(
            code: 'NO_USER',
            message: 'No authenticated user',
          );
        }
        return await user.getIdToken(forceRefresh);
      },
      serviceName: 'FirebaseAuthService.getIdToken',
    );
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return handleService(
      action: () async {
        if (email.isEmpty) {
          throw AuthException(
            code: 'INVALID_INPUT',
            message: 'Email cannot be empty',
          );
        }

        AuthValidator.validateEmail(email);

        await _auth.sendPasswordResetEmail(email: email.trim());
      },
      serviceName: 'FirebaseAuthService.sendPasswordResetEmail',
    );
  }

  @override
  Future<void> sendEmailVerification() {
    return handleService(
      action: () async {
        final user = _auth.currentUser;
        if (user == null) {
          throw AuthException(
            code: 'NO_USER',
            message: 'No authenticated user',
          );
        }
        await user.sendEmailVerification();
      },
      serviceName: 'FirebaseAuthService.sendEmailVerification',
    );
  }

  @override
  Future<void> updatePassword(String newPassword) {
    return handleService(
      action: () async {
        final user = _auth.currentUser;
        if (user == null) {
          throw AuthException(
            code: 'NO_USER',
            message: 'No authenticated user',
          );
        }
        await user.updatePassword(newPassword);
      },
      serviceName: 'FirebaseAuthService.updatePassword',
    );
  }

  // @override
  // Future<void> updateEmail(String newEmail) {
  //   return handleService(
  //     action: () async {
  //       final user = _auth.currentUser;
  //       if (user == null) {
  //         throw AuthException(
  //           code: 'NO_USER',
  //           message: 'No authenticated user',
  //         );
  //       }
  //       await user.updateEmail(newEmail.trim());
  //     },
  //     serviceName: 'FirebaseAuthService.updateEmail',
  //   );
  // }

  // @override
  // Future<void> deleteAccount() {
  //   return handleService(
  //     action: () async {
  //       final user = _auth.currentUser;
  //       if (user == null) {
  //         throw AuthException(
  //           code: 'NO_USER',
  //           message: 'No authenticated user',
  //         );
  //       }
  //       await user.delete();
  //     },
  //     serviceName: 'FirebaseAuthService.deleteAccount',
  //   );
  // }
}
