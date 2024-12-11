import 'package:chattify/src/features/home/presentation/pages/home_page.dart';
import 'package:chattify/src/features/messages/presentation/pages/messages_page.dart';
import 'package:chattify/src/features/settings/presentation/pages/settings_page.dart';
import 'package:chattify/src/router/route_path.dart';
import 'package:go_router/go_router.dart';

final routes = [
  StatefulShellRoute.indexedStack(
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RoutePath.messages,
            builder: (context, state) {
              return const MessagesPage();
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RoutePath.settings,
            builder: (context, state) {
              return const SettingsPage();
            },
          ),
        ],
      ),
    ],
    builder: (context, state, navigationShell) {
      return HomePage(navigationShell: navigationShell);
    },
  )
];
