import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/auth_repository.dart';
import '../providers/auth_provider.dart';
import 'dart:async';

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<UserModel?>>((ref) {
      final repo = ref.watch(authRepositoryProvider);
      return AuthController(repo);
    });

class AuthController extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthRepository _repo;
  StreamSubscription<UserModel?>? _authSubscription;

  AuthController(this._repo) : super(const AsyncValue.loading()) {
    _initAuthState();
  }

  /// Khởi tạo: lắng nghe trạng thái đăng nhập Firebase
  void _initAuthState() {
    // Method listen sẽ chạy callback bên trong khi FirebaseAuth có sự thay đổi
    // authStateChanges là stream UserModel? đại diện cho firebaseauth
    _repo.authStateChanges.listen(
      (user) {
        // Không đổi state khi đang loading đăng nhập / đăng ký
        if (mounted) {
          state = AsyncValue.data(user);
        }
      },
      onError: (e, st) {
        if (mounted) {
          state = AsyncValue.error(e, st);
        }
      },
    );
  }

  /// Đăng nhập bằng email & password
  Future<void> signIn(String email, String password) =>
      _handleAuthAction(() => _repo.signInWithEmail(email, password));

  /// Đăng ký tài khoản mới
  Future<void> register(String email, String password) =>
      _handleAuthAction(() => _repo.registerWithEmail(email, password));

  /// Đăng nhập bằng Google
  Future<void> signInWithGoogle() =>
      _handleAuthAction(() => _repo.signInWithGoogle());

  /// Đăng nhập bằng Facebook
  Future<void> signInWithFacebook() =>
      _handleAuthAction(() => _repo.signInWithFacebook());

  /// Đăng xuất
  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await _repo.signOut();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Làm mới ID token thủ công (nếu có backend riêng)
  Future<String?> refreshToken() => _repo.refreshIdToken();

  /// Lấy user hiện tại (không phụ thuộc vào stream)
  Future<UserModel?> getCurrentUser() => _repo.getCurrentUser();

  /// Helper: quản lý state loading / error / data cho các action
  Future<void> _handleAuthAction(Future<UserModel?> Function() action) async {
    state = const AsyncValue.loading();
    try {
      final user = await action();
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}
