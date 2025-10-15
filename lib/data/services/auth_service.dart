import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Stream<User?> get authStateChanges;
  Future<String?> signInWithEmail(String email, String password);
  Future<String?> registerWithEmail(String email, String password);
  Future<void> signOut();
  Future<String?> signInWithGoogle();
  Future<String?> signInWithFacebook();
  User? currentUser();
  Future<String?> getIdToken({bool forceRefresh = false});
  Future<void> sendPasswordResetEmail(String email);
  Future<void> sendEmailVerification();
  Future<void> updatePassword(String newPassword);
  // Future<void> updateEmail(String newEmail);

}