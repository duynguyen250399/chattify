import 'package:chattify/src/assets/asset_icons.dart';
import 'package:chattify/src/core/ui/widgets/svg_image.dart';
import 'package:chattify/src/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<HomeRoute> get homeRoutes {
  return [
    HomeRoute(
      icon: AssetIcons.messagesOutlined,
      activeIcon: AssetIcons.messagesSolid,
      title: 'Messages',
    ),
    HomeRoute(
      icon: AssetIcons.notificationsOutlined,
      activeIcon: AssetIcons.notificationsSolid,
      title: 'Notifications',
    ),
    HomeRoute(
      icon: AssetIcons.accountOutlined,
      activeIcon: AssetIcons.accountSolid,
      title: 'Account',
    ),
  ];
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final currentRoute = homeRoutes[navigationShell.currentIndex];
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: currentRoute.title != null
            ? Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SvgImage(
                          currentRoute.icon,
                          width: 24,
                        ),
                      ),
                    ),
                    TextSpan(text: currentRoute.title!),
                  ],
                ),
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w700),
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
    this.activeIcon,
  });

  final String? title;

  final String icon;

  final String? activeIcon;
}
