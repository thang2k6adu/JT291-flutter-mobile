import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/core/constants/constants.dart';
import 'package:jt291_flutter_mobile/components/components.dart';
import 'package:jt291_flutter_mobile/data/providers/auth/auth_provider.dart';
import 'package:jt291_flutter_mobile/data/services/firebase_auth_service.dart';

enum ProviderLogin { google, facebook, apple, password }

class AuthController extends AutoDisposeNotifier<void> {
  late final FirebaseAuthService authFirebase;

  @override
  void build() {
    authFirebase = FirebaseAuthService();
  }

  Future<void> loginWithPassword(
    BuildContext context,
    String username,
    String password,
  ) async {
    final overlay = UOverlay(context);
    String messageLogin = '';
    try {
      final idToken = (await authFirebase.signInWithEmailAndPassword(
        username: username,
        password: password,
      ));

      messageLogin = "Đang đăng nhập ...";

      overlay.show(message: messageLogin, loading: true);

      final authNotifier = ref.read(userAuthProvider.notifier);
      final user = await authNotifier.login(idToken);
      if (user != null) {
        overlay.showWithTimeout(message: "Đăng nhập thành công");
        await Future.delayed(Duration(microseconds: 500));
        if (context.mounted) {
          goScreen(context, RouteConstants.main);
        }
      }
    } catch (e) {
      if (context.mounted) {
        overlay.showWithTimeout(message: "Đăng nhập thất bại");
      }
    } finally {
      overlay.hide();
    }
  }

  Future<void> loginWithProvide(
    BuildContext context,
    ProviderLogin provider,
  ) async {
    final overlay = UOverlay(context);
    String messageLogin = '';
    try {
      String idToken = '';
      switch (provider) {
        case ProviderLogin.google:
          idToken = (await authFirebase.signInWithGoogle()) ?? '';

          messageLogin = "Đang đăng nhập với google...";
          break;
        default:
          return;
      }

      messageLogin = "Đang đăng nhập ...";

      overlay.show(message: messageLogin, loading: true);

      final authNotifier = ref.read(userAuthProvider.notifier);
      final user = await authNotifier.login(idToken);

      if (user != null) {
        overlay.showWithTimeout(message: "Đăng nhập thành công");
        await Future.delayed(Duration(microseconds: 500));
        if (context.mounted) {
          goScreen(context, RouteConstants.main);
        }
      }
    } catch (e) {
      if (context.mounted) {
        overlay.showWithTimeout(message: "Đăng nhập thất bại");
      }
    } finally {
      overlay.hide();
    }
  }
}

final authControllerProvider =
    AutoDisposeNotifierProvider<AuthController, void>(AuthController.new);
