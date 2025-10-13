import '../models/user_model.dart';
import '../services/firebase_auth_service.dart';
import '../services/secure_storage_service.dart';

class AuthRepository {
  final FirebaseAuthService _service;
  final SecureStorageService _storage = SecureStorageService();

  AuthRepository(this._service);

  /// Lắng nghe thay đổi trạng thái đăng nhập (FirebaseAuth -> UserModel)
  Stream<UserModel?> get authStateChanges =>
      _service.authStateChanges.map(UserModel.fromFirebaseUser);

  /// Đăng nhập bằng Email & Password
  Future<UserModel?> signInWithEmail(String email, String password) async {
    final user = await _service.signInWithEmail(email, password);
    // save token and user id if available
    final token = await _service.getIdToken();
    if (token != null) await _storage.saveAccessToken(token);
    if (user != null) await _storage.saveUserId(user.uid);
    return UserModel.fromFirebaseUser(user);
  }

  /// Đăng ký bằng Email & Password
  Future<UserModel?> registerWithEmail(String email, String password) async {
    final user = await _service.registerWithEmail(email, password);
    final token = await _service.getIdToken();
    if (token != null) await _storage.saveAccessToken(token);
    if (user != null) await _storage.saveUserId(user.uid);
    return UserModel.fromFirebaseUser(user);
  }

  /// Đăng nhập bằng Google
  Future<UserModel?> signInWithGoogle() async {
    final user = await _service.signInWithGoogle();
    final token = await _service.getIdToken();
    if (token != null) await _storage.saveAccessToken(token);
    if (user != null) await _storage.saveUserId(user.uid);
    return UserModel.fromFirebaseUser(user);
  }

  /// Đăng nhập bằng Facebook
  Future<UserModel?> signInWithFacebook() async {
    final user = await _service.signInWithFacebook();
    final token = await _service.getIdToken();
    if (token != null) await _storage.saveAccessToken(token);
    if (user != null) await _storage.saveUserId(user.uid);
    return UserModel.fromFirebaseUser(user);
  }

  /// Đăng xuất
  Future<void> signOut() async {
    await _service.signOut();
    await _storage.clearAll();
  }

  /// Force refresh id token, trả về token string and save it to secure storage
  Future<String?> refreshIdToken() async {
    final token = await _service.getIdToken(forceRefresh: true);
    if (token != null) await _storage.saveAccessToken(token);
    return token;
  }

  /// Get current user from service mapped to domain model
  Future<UserModel?> getCurrentUser() async {
    final user = _service.currentUser();
    return UserModel.fromFirebaseUser(user);
  }
}
