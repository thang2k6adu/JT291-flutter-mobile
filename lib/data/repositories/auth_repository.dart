import '../models/user_model.dart';
import '../services/firebase_auth_service.dart';
import '../services/secure_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuthService _service;
  final SecureStorageService _storage = SecureStorageService();

  AuthRepository(this._service);

  /// Stream lắng nghe thay đổi trạng thái đăng nhập (FirebaseAuth -> UserModel)
  Stream<UserModel?> get authStateChanges =>
      _service.authStateChanges.map(UserModel.fromFirebaseUser);

  /// Xử lý chung sau khi đăng nhập / đăng ký
  Future<UserModel?> _handleAuthResult(User? user) async {
    if (user == null) return null;
    final token = await _service.getIdToken();
    if (token != null) await _storage.saveAccessToken(token);
    await _storage.saveUserId(user.uid);
    return UserModel.fromFirebaseUser(user);
  }

  /// Đăng nhập bằng Email & Password
  Future<UserModel?> signInWithEmail(String email, String password) async {
    final user = await _service.signInWithEmail(email, password);
    return _handleAuthResult(user);
  }

  /// Đăng ký bằng Email & Password
  Future<UserModel?> registerWithEmail(String email, String password) async {
    final user = await _service.registerWithEmail(email, password);
    return _handleAuthResult(user);
  }

  /// Đăng nhập bằng Google
  Future<UserModel?> signInWithGoogle() async {
    final user = await _service.signInWithGoogle();
    return null;
  }

  /// Đăng nhập bằng Facebook
  Future<UserModel?> signInWithFacebook() async {
    final user = await _service.signInWithFacebook();
    return _handleAuthResult(user);
  }

  /// Đăng xuất
  Future<void> signOut() async {
    await _service.signOut();
    await _storage.clearAll();
  }

  /// Force refresh id token, lưu vào SecureStorage
  Future<String?> refreshIdToken() async {
    final token = await _service.getIdToken(forceRefresh: true);
    if (token != null) await _storage.saveAccessToken(token);
    return token;
  }

  /// Lấy user hiện tại
  Future<UserModel?> getCurrentUser() async {
    final user = _service.currentUser();
    return UserModel.fromFirebaseUser(user);
  }
}
