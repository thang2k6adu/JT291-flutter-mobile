import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:io';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Email & Password
  Future<User?> signInWithEmail(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<User?> registerWithEmail(String email, String password) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> signOut() async => _auth.signOut();

  // 🔹 Google Sign-In
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return null; // user cancel

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  // 🔹 Facebook Login
  Future<User?> signInWithFacebook() async {
    // 🔥 QUAN TRỌNG: Check platform trước khi dùng Facebook Auth
    if (!Platform.isAndroid && !Platform.isIOS) {
      print('🚫 Facebook Auth only supports Android and iOS');
      return null;
    }

    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status != LoginStatus.success) {
        print('❌ Facebook login failed: ${result.status}');
        return null;
      }

      final OAuthCredential credential = FacebookAuthProvider.credential(
        result.accessToken!.token,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print('❌ Facebook Sign-In error: $e');
      return null;
    }
  }
}
