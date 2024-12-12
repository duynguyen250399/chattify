import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> _initializeApp() async {
  try {
    await dotenv.load(fileName: '.env');

    Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_API_KEY']!,
    );
  } catch (error) {
    log('Failed to initialize app: $error');
  }
}

void bootstrap(FutureOr<Widget> Function() builder) async {
  await _initializeApp();

  runApp(await builder());
}
