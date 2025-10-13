import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:io';
import 'package:flutter_boilerplate/core/utils/wrapper.dart';
import 'package:flutter_boilerplate/core/errors/auth_exception.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Email & Password
  Future<User?> signInWithEmail(String email, String password) {
    return handleService(
      action: () => _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((cred) => cred.user),
    );
  }

  Future<User?> registerWithEmail(String email, String password) {
    return handleService(
      action: () async {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return userCredential.user;
      },
    );
  }

  Future<void> signOut() {
    return handleService(action: () => _auth.signOut());
  }

  // 🔹 Google Sign-In
  Future<User?> signInWithGoogle() {
    return handleService(
      action: () async {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          throw AuthException(
            code: 'CANCELLED',
            message: 'User cancelled Google sign-in',
          );
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final userCredential = await _auth.signInWithCredential(credential);
        return userCredential.user;
      },
    );
  }

  // 🔹 Facebook Login
  Future<User?> signInWithFacebook() {
    return handleService(
      action: () async {
        if (!Platform.isAndroid && !Platform.isIOS) {
          throw AuthException(
            code: 'UNSUPPORTED_PLATFORM',
            message: 'Facebook Auth only supports Android and iOS',
          );
        }

        final result = await FacebookAuth.instance.login();
        if (result.status != LoginStatus.success) {
          throw AuthException(
            code: result.status.name,
            message: 'Facebook login failed',
          );
        }

        final credential = FacebookAuthProvider.credential(
          result.accessToken!.token,
        );
        final userCredential = await _auth.signInWithCredential(credential);
        return userCredential.user;
      },
    );
  }
}
