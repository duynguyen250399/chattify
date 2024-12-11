import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtension on BuildContext {
  String? get routePath {
    return GoRouter.of(this).state?.path;
  }
}
