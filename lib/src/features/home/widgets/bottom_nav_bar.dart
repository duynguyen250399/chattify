import 'package:chattify/src/core/ui/widgets/svg_image.dart';
import 'package:chattify/src/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

const _itemPadding = 12.0;
const _itemIconGap = 8.0;

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
    final height = kBottomNavigationBarHeight +
        viewPadding.bottom +
        _itemPadding +
        _itemIconGap;

    return Container(
      height: height,
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
          padding: const EdgeInsets.all(_itemPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgImage(
                isActive ? (activeIcon ?? icon) : icon,
                color: isActive ? theme.primaryColor : Colors.black,
                width: iconSize,
              ),
              const Gap(_itemIconGap),
              Text(
                label ?? '',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isActive ? theme.primaryColor : Colors.black,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
