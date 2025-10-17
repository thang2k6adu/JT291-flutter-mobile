// Function Go Router
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void pushScreen(BuildContext context, String path, {Object? extra}) =>
    GoRouter.of(context).push(path, extra: extra);

void goScreen(BuildContext context, String path) =>
    GoRouter.of(context).go(path);

void goBack(BuildContext context) => GoRouter.of(context).pop();
