import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:jt291_flutter_mobile/core/core.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentFirebaseUser => _auth.currentUser;

  final GoogleSignIn _gsi = GoogleSignIn.instance;

  final String webClientId = ApiConstants.webClientId;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  bool _initialized = false;

  Future<void> _ensureInitialized() async {
    if (_initialized) return;
    await _gsi.initialize(serverClientId: kIsWeb ? null : webClientId);
    _initialized = true;
  }

  Future<String?> signInWithGoogle() async {
    await _ensureInitialized();
    try {
      GoogleSignInAccount? account = await _gsi
          .attemptLightweightAuthentication();

      account ??= await _gsi.authenticate(
        scopeHint: const <String>[
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );

      final googleAuth = account.authentication;
      final googleIdToken = googleAuth.idToken;
      if (googleIdToken == null) return null;

      final credential = GoogleAuthProvider.credential(idToken: googleIdToken);
      final userCred = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      // 4) Get **Firebase ID token**
      final firebaseIdToken = await userCred.user?.getIdToken(true);
      return firebaseIdToken;
    } on GoogleSignInException catch (e) {
      throw Exception('Google Sign-In failed: $e');
    } catch (e) {
      throw Exception('Unexpected Google Sign-In error: $e');
    }
  }

  Future<String> signInWithEmailAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: username, password: password);

      final user = userCredential.user;
      if (user == null) {
        throw Exception('Không thể đăng nhập: Firebase user rỗng.');
      }
      // Lấy Firebase ID Token
      final idToken = await user.getIdToken(true);
      if (idToken == null) {
        throw Exception('Không thể đăng nhập: Firebase user rỗng.');
      }
      return idToken;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw FirebaseAuthException(
            code: e.code,
            message: 'Không tìm thấy người dùng với email này.',
          );
        case 'wrong-password':
          throw FirebaseAuthException(
            code: e.code,
            message: 'Sai mật khẩu. Vui lòng thử lại.',
          );
        case 'invalid-email':
          throw FirebaseAuthException(
            code: e.code,
            message: 'Email không hợp lệ.',
          );
        case 'user-disabled':
          throw FirebaseAuthException(
            code: e.code,
            message: 'Tài khoản này đã bị vô hiệu hóa.',
          );
        default:
          throw FirebaseAuthException(
            code: e.code,
            message: e.message ?? 'Đăng nhập thất bại, vui lòng thử lại.',
          );
      }
    } catch (e) {
      throw Exception('Lỗi không xác định khi đăng nhập: $e');
    }
  }
}
