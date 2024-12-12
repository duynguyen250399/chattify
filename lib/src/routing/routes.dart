import 'package:chattify/src/features/account/pages/account_page.dart';
import 'package:chattify/src/features/home/pages/home_page.dart';
import 'package:chattify/src/features/messages/pages/messages_page.dart';
import 'package:chattify/src/features/notifications/pages/notifications_page.dart';
import 'package:chattify/src/features/auth/pages/sign_in_page.dart';
import 'package:chattify/src/routing/route_path.dart';
import 'package:go_router/go_router.dart';

final routes = [
  GoRoute(
    path: RoutePath.signIn,
    builder: (context, state) {
      return const SignInPage();
    },
  ),
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
  ),
];
