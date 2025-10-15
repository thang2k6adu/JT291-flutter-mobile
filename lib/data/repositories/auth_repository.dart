import '../models/user_model.dart';
import '../services/firebase_auth_service_impl.dart';
import '../services/secure_storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

// 🚨 CRITICAL: Fix bug signInWithGoogle() return null: oke
// 🚨 CRITICAL: Thêm error handling và propagation
// 📋 HIGH: Implement token management và auto-refresh
// 📋 HIGH: Thêm session management và restore
// 🔧 MEDIUM: Implement retry logic cho network operations
// 🔧 LOW: Thêm analytics và monitoring
// 🔧 LOW: Chuẩn hóa dependency injection
// 🔧 LOW: Chuẩn bị cho unit testing
class AuthRepository {
  final FirebaseAuthService _service;
  final SecureStorageService _storage = SecureStorageService();

  AuthRepository(this._service);

  /// Stream lắng nghe thay đổi trạng thái đăng nhập (FirebaseAuth -> UserModel)
  // Map ở đây là để chuyển đổi User (Firebase) sang UserModel (của mình)
  Stream<UserModel?> get authStateChanges =>
      _service.authStateChanges.map(UserModel.fromFirebaseUser);

  /// Xử lý chung sau khi đăng nhập / đăng ký
  Future<UserModel?> _handleAuthResult(String? token) async {
    if (token == null) return null;
    
    // Trường hợp này có thể sai nếu như đăng nhập bằng backend sau đó dùng service của firebase(backend first)
    // Nếu dùng backend first thì current user có thể không tồn tại nhưng lại có token
    // Còn firebase first thì điều này không đáng lo
    final user = _service.currentUser();
    if (user == null) return null;
    
    await _storage.saveAccessToken(token);
    await _storage.saveUserId(user.uid);
    
    return UserModel.fromFirebaseUser(user);
  }
  /// Đăng nhập bằng Email & Password
  Future<UserModel?> signInWithEmail(String email, String password) async {
    final token = await _service.signInWithEmail(email, password);
    return _handleAuthResult(token);
  }

  /// Đăng ký bằng Email & Password
  Future<UserModel?> registerWithEmail(String email, String password) async {
    final token = await _service.registerWithEmail(email, password);
    return _handleAuthResult(token);
  }

  /// Đăng nhập bằng Google
  Future<UserModel?> signInWithGoogle() async {
    final token = await _service.signInWithGoogle();
    return _handleAuthResult(token);
  }

  /// Đăng nhập bằng Facebook
  Future<UserModel?> signInWithFacebook() async {
    final token = await _service.signInWithFacebook();
    return _handleAuthResult(token);
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

  /// Lấy User hiện tại
  Future<UserModel?> getCurrentUser() async {
    final user = _service.currentUser();
    return UserModel.fromFirebaseUser(user);
  }
}
