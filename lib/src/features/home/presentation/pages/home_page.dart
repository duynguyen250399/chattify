import 'package:chattify/src/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final homeRoutes = [
  HomeRoute(
    icon: 'assets/icons/messages.svg',
    title: 'Messages',
  ),
  HomeRoute(
    icon: 'assets/icons/settings.svg',
    title: 'Settings',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final currentRoute = homeRoutes[navigationShell.currentIndex];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: currentRoute.title != null
            ? Text(
                currentRoute.title!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              )
            : null,
      ),
      body: navigationShell,
      bottomNavigationBar: HomeBottomNavBar(
        selectedIndex: navigationShell.currentIndex,
        onSelectIndex: navigationShell.goBranch,
      ),
    );
  }
}

class HomeRoute {
  HomeRoute({
    this.title,
    required this.icon,
  });

  final String? title;

  final String icon;
}
