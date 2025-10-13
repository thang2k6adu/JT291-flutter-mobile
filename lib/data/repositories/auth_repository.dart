import '../models/user_model.dart';
import '../services/firebase_auth_service.dart';

class AuthRepository {
  final FirebaseAuthService _service;
  AuthRepository(this._service);

  /// Lắng nghe thay đổi trạng thái đăng nhập (FirebaseAuth -> UserModel)
  Stream<UserModel?> get authStateChanges =>
      _service.authStateChanges.map(UserModel.fromFirebaseUser);

  /// Đăng nhập bằng Email & Password
  Future<UserModel?> signInWithEmail(String email, String password) async {
    final user = await _service.signInWithEmail(email, password);
    return UserModel.fromFirebaseUser(user);
  }

  /// Đăng ký bằng Email & Password
  Future<UserModel?> registerWithEmail(String email, String password) async {
    final user = await _service.registerWithEmail(email, password);
    return UserModel.fromFirebaseUser(user);
  }

  /// Đăng nhập bằng Google
  Future<UserModel?> signInWithGoogle() async {
    final user = await _service.signInWithGoogle();
    return UserModel.fromFirebaseUser(user);
  }

  /// Đăng nhập bằng Facebook
  Future<UserModel?> signInWithFacebook() async {
    final user = await _service.signInWithFacebook();
    return UserModel.fromFirebaseUser(user);
  }

  /// Đăng xuất
  Future<void> signOut() => _service.signOut();
}
