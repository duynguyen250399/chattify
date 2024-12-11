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
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: List.generate(homeRoutes.length, (index) {
          final item = homeRoutes[index];

          return Expanded(
            child: _BottomNavBarItem(
              icon: item.icon,
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
    this.label,
    this.onTap,
    this.isActive = false,
  });

  final String? label;

  final String icon;

  final VoidCallback? onTap;

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isActive ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgImage(
                icon,
                color: isActive ? Colors.white : Colors.black,
              ),
              if (label != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    label!,
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.black,
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
