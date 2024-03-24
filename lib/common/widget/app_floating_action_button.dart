import 'package:flutter/material.dart';
import 'package:real_estate_app/resources/dimens.dart';

import 'blurred_container.dart';

class AppFloatingActionButton extends StatelessWidget {
  final Color? color;
  final double? size;
  final IconData icon;
  final Color? backgroundColor;
  final void Function()? onPressed;

  const AppFloatingActionButton({
    super.key,
    this.color,
    this.onPressed,
    required this.icon,
    this.size = Dimens.k60,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: FloatingActionButton(
        elevation: 0,
        onPressed: onPressed,
        shape: const CircleBorder(),
        backgroundColor: backgroundColor,
        child: _child(),
      ),
    );
  }

  Widget _child() {
    if (backgroundColor == Colors.transparent) {
      return BlurredContainer(
        width: size,
        height: size,
        child: _icon,
      );
    } else {
      return _icon;
    }
  }

  Icon get _icon {
    return Icon(
      icon,
      color: color,
    );
  }
}
