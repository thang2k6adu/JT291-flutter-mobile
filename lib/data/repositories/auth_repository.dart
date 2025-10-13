import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../services/firebase_auth_service.dart';

class AuthRepository {
  final FirebaseAuthService _service;
  AuthRepository(this._service);

  Stream<UserModel?> get authStateChanges =>
      _service.authStateChanges.map(UserModel.fromFirebaseUser);

  Future<UserModel?> signIn(String email, String password) async {
    final user = await _service.signInWithEmail(email, password);
    return UserModel.fromFirebaseUser(user);
  }

  Future<UserModel?> register(String email, String password) async {
    final user = await _service.registerWithEmail(email, password);
    return UserModel.fromFirebaseUser(user);
  }

  Future<void> signOut() => _service.signOut();
}
