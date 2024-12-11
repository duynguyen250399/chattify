import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImage extends StatelessWidget {
  const SvgImage(
    this.path, {
    super.key,
    this.color,
    this.width,
    this.height,
  });

  final String path;

  final Color? color;

  final double? width;

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}
