import 'package:chattify/src/features/account/presentation/pages/account_page.dart';
import 'package:chattify/src/features/home/presentation/pages/home_page.dart';
import 'package:chattify/src/features/messages/presentation/pages/messages_page.dart';
import 'package:chattify/src/features/notifications/presentation/pages/notifications_page.dart';
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
            path: RoutePath.notifications,
            builder: (context, state) {
              return const NotificationsPage();
            },
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            path: RoutePath.account,
            builder: (context, state) {
              return const AccountPage();
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
