import 'package:chattify/src/router/routes.dart';
import 'package:go_router/go_router.dart';

const initialLocation = '/';

final router = GoRouter(
  initialLocation: initialLocation,
  routes: routes,
);
