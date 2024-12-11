import 'package:chattify/src/core/ui/themes/theme_constants.dart';
import 'package:flutter/material.dart';

enum _ButtonType {
  icon,
  text,
  iconAndText,
}

enum ButtonAppearance {
  solid,
  outlined,
}

class Button extends StatelessWidget {
  final _ButtonType _type;

  final String? label;

  final Widget? icon;

  final ButtonAppearance appearance;

  final VoidCallback? onTap;

  const Button({
    super.key,
    required this.icon,
    required this.label,
    this.appearance = ButtonAppearance.solid,
    this.onTap,
  }) : _type = _ButtonType.iconAndText;

  const Button.icon({
    super.key,
    required this.icon,
    this.appearance = ButtonAppearance.solid,
    this.onTap,
  })  : _type = _ButtonType.icon,
        label = null;

  const Button.text({
    super.key,
    required this.label,
    this.appearance = ButtonAppearance.solid,
    this.onTap,
  })  : _type = _ButtonType.text,
        icon = null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isOutlined = appearance == ButtonAppearance.outlined;

    if (_type == _ButtonType.iconAndText) {
      return ElevatedButton.icon(
        icon: icon,
        label: Text(label!),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            !isOutlined ? theme.primaryColor : Colors.white,
          ),
          shape: WidgetStatePropertyAll(
            isOutlined
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      ThemeConstants.buttonBorderRadius,
                    ),
                    side: BorderSide(color: theme.primaryColor),
                  )
                : null,
          ),
          foregroundColor: WidgetStatePropertyAll(
            isOutlined ? theme.primaryColor : Colors.white,
          ),
        ),
        onPressed: onTap,
      );
    }

    if (_type == _ButtonType.icon) {
      return IconButton(onPressed: onTap, icon: icon!);
    }

    if (_type == _ButtonType.text) {
      return TextButton(onPressed: onTap, child: Text(label!));
    }

    return const SizedBox.shrink();
  }
}
