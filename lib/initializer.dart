import 'dart:developer';

import 'package:chattify/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class AppInitializer {
  static Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      log('Error while initializing app: $e');
    }
  }
}
