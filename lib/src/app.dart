import 'package:chattify/src/router/router.dart';
import 'package:flutter/material.dart';

class ChattifyApp extends StatelessWidget {
  const ChattifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chattify',
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
