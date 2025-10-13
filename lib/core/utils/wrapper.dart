import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_boilerplate/core/errors/app_exception.dart';
import 'package:flutter_boilerplate/core/errors/generic_exception.dart';
import 'package:flutter_boilerplate/core/errors/auth_exception.dart';
import 'package:flutter_boilerplate/core/errors/network_exception.dart';
import 'package:flutter_boilerplate/core/errors/api_exception.dart';

Future<T> handleService<T>({
  required Future<T> Function() action,
  Map<Type, AppException Function(Object error)>? exceptionMapping,
}) async {
  try {
    return await action();
  } catch (e) {
    // Nếu có mapping custom theo type, dùng nó
    if (exceptionMapping != null) {
      for (var entry in exceptionMapping.entries) {
        if (e.runtimeType == entry.key) {
          throw entry.value(e);
        }
      }
    }

    // Default mappings
    if (e is FirebaseAuthException) {
      throw AuthException.fromFirebase(e);
    } else if (e is SocketException) {
      throw NetworkException.fromSocket(e);
    } else if (e is TimeoutException) {
      throw NetworkException.fromTimeout();
    } else if (e is HttpException) {
      throw ApiException(code: 'HTTP_ERROR', message: e.message);
    } else {
      throw GenericException(code: 'UNKNOWN', message: e.toString());
    }
  }
}
