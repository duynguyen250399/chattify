import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    super.key,
    this.onTap,
    this.child,
  });

  final VoidCallback? onTap;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const size = 54.0;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size),
      child: Ink(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor.withOpacity(0.3),
              offset: const Offset(0, 4),
              blurRadius: 16,
              spreadRadius: 4,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
