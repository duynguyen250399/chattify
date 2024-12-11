import 'package:chattify/src/core/ui/widgets/svg_image.dart';
import 'package:chattify/src/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({
    super.key,
    this.selectedIndex = 0,
    required this.onSelectIndex,
  });

  final int selectedIndex;

  final void Function(int index) onSelectIndex;

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return Container(
      height: kBottomNavigationBarHeight + viewPadding.bottom,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: viewPadding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: List.generate(homeRoutes.length, (index) {
          final item = homeRoutes[index];

          return Expanded(
            child: _BottomNavBarItem(
              icon: item.icon,
              activeIcon: item.activeIcon,
              label: item.title,
              isActive: index == widget.selectedIndex,
              onTap: () => widget.onSelectIndex(index),
            ),
          );
        }),
      ),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  const _BottomNavBarItem({
    required this.icon,
    this.activeIcon,
    this.label,
    this.onTap,
    this.isActive = false,
  });

  final String? label;

  final String icon;

  final String? activeIcon;

  final VoidCallback? onTap;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(8);
    const iconSize = 20.0;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Ink(
          padding: const EdgeInsets.all(12),
          child: SvgImage(
            isActive ? (activeIcon ?? icon) : icon,
            color: isActive ? theme.primaryColor : Colors.black,
            width: iconSize,
          ),
        ),
      ),
    );
  }
}
