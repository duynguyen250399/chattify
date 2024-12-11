import 'package:chattify/src/router/route_path.dart';
import 'package:chattify/src/router/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

const initialLocation = RoutePath.signIn;
final rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: initialLocation,
  navigatorKey: rootNavigatorKey,
  routes: routes,
);
