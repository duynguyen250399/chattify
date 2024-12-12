import 'package:chattify/bootstrap.dart';
import 'package:chattify/src/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => const ChattifyApp());
}
