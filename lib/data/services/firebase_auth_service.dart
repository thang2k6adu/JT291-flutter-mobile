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

  Future<String?> signInWithGoogle() {
    return handleService(
      action: () async {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          throw Exception('Google sign in failed, null result.');
        }
        final googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          // accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final result = await _auth.signInWithCredential(credential);
        print('result.user ${result.user}');

        final idToken = await result.user?.getIdToken(true);
        print('idToken $idToken');
        return idToken;

        // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        // if (googleUser == null) {
        //   throw AuthException(
        //     code: 'CANCELLED',
        //     message: 'User cancelled Google sign-in',
        //   );
        // }

        // final GoogleSignInAuthentication googleAuth =
        //     await googleUser.authentication;
        // final credential = GoogleAuthProvider.credential(
        //   accessToken: googleAuth.accessToken,
        //   idToken: googleAuth.idToken,
        // );

        // final userCredential = await _auth.signInWithCredential(credential);

        // print('userCredential.user ${userCredential.user}');
        // print('userCredential.user ');
        // return userCredential.user;
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

  /// Return current authenticated user or null
  User? currentUser() => _auth.currentUser;

  /// Get ID token for current user. Use `forceRefresh` to force a refresh.
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
    );
  }
}
