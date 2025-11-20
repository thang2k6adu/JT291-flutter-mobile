import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jt291_flutter_mobile/core/constants/constants.dart';
import 'package:jt291_flutter_mobile/data/models/auth/token_model.dart';
import 'package:jt291_flutter_mobile/data/models/users/user_model.dart';
import 'package:jt291_flutter_mobile/data/services/api_service.dart';

class AuthService {
  final ApiService _apiService = ApiService();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthService();

  FutureOr<TokenModel?> getToken() async {
    try {
      final accessToken = await _storage.read(
        key: StorageConstants.accessTokenKey,
      );
      final refreshToken = await _storage.read(
        key: StorageConstants.refreshTokenKey,
      );
      final expiredAt = await _storage.read(
        key: StorageConstants.tokenExpiredKey,
      );

      if (expiredAt == null || refreshToken == null || accessToken == null) {
        return null;
      }
      print('Token expired at $expiredAt');
      if (DateTime.tryParse(expiredAt)!.isBefore(DateTime.now())) {
        return _apiService.refreshToken();
      }

      return TokenModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiredAt: DateTime.tryParse(expiredAt),
      );
    } catch (e) {
      print("Error Call API Login: ${e.toString()}");
      rethrow;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await _apiService.get('/auth/me');
      return UserModel.fromJson(response['data']);
    } catch (e) {
      print("getCurrentUser fail: $e");
      return null;
    }
  }

  Future<TokenModel?> loginWithToken(String idToken) async {
    try {
      final response = await _apiService.post(
        '/v1/auth/login',
        data: {'idToken': idToken},
      );
      final authToken = TokenModel.fromJson(response['data']);
      await _saveTokens(authToken);

      return authToken;
    } catch (e) {
      print("Error Call API Login: ${e.toString()}");
      rethrow;
    }
  }

  // /auth/login
  Future<TokenModel?> loginWithEmailAndPassword(String email, String password) async {
    try {

      print("loginWithEmailAndPassword email: $email");
      final response = await _apiService.post(
        '/auth/login',
        data: {'ref_id': email, 'password': password},
      );

      print("loginWithEmailAndPassword response: ${response}");

      if (response['error'] == false) {
        final authToken = TokenModel.fromJson(response['data']);
        print("loginWithEmailAndPassword authToken parsed: ${authToken}");
        await _saveTokens(authToken);
        print("loginWithEmailAndPassword authToken: ${authToken}");
        print("loginWithEmailAndPassword saveTokens success");
        return authToken;

      } else {
        throw Exception(response['message']);
      }

    } catch (e) {
      print("Error Call API Login: ${e.toString()}");
      rethrow;
    }
  }

  Future<void> _saveTokens(TokenModel token) async {
    await _storage.write(
      key: StorageConstants.accessTokenKey,
      value: token.accessToken,
    );
    if (token.refreshToken != null) {
      await _storage.write(
        key: StorageConstants.refreshTokenKey,
        value: token.refreshToken!,
      );
    }
    if (token.expiredAt != null) {
    await _storage.write(
      key: StorageConstants.tokenExpiredKey,
      value: token.expiredAt!.toIso8601String(),
      );
    }
  }

  Future<TokenModel?> restoreSession() async {
    final tokens = await _getStoredTokens();

    if (tokens != null && tokens.expiredAt != null) {
      if (tokens.expiredAt!.isAfter(DateTime.now())) {
        try {
          await _apiService.get('/v1/users/me');
          return tokens;
        } catch (e) {
          return _apiService.refreshToken();
        }
      }
    }

    return null;
  }

  Future<TokenModel?> _getStoredTokens() async {
    final accessToken = await _storage.read(
      key: StorageConstants.accessTokenKey,
    );
    final refreshToken = await _storage.read(
      key: StorageConstants.refreshTokenKey,
    );
    final expiredStr = await _storage.read(
      key: StorageConstants.tokenExpiredKey,
    );

    if (accessToken != null && refreshToken != null && expiredStr != null) {
      return TokenModel(
        accessToken: accessToken,
        refreshToken: refreshToken,
        expiredAt: DateTime.parse(expiredStr),
      );
    }

    return null;
  }

  Future<void> logout() async {
    await _apiService.clearTokens();
  }

  Future<void> clearTokens() async {
    await _apiService.clearTokens();
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});
