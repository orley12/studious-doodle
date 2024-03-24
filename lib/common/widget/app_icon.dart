import 'package:flutter/material.dart';

import '../../resources/dimens.dart';

class AppIcon extends StatelessWidget {
  final Color? color;
  final double? size;
  final IconData icon;

  const AppIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size ?? Dimens.k24,
      color: color ?? Theme.of(context).colorScheme.surface,
    );
  }
}
