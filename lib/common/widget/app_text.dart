import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextStyle? style;

  const AppText(
    this.text, {
    super.key,
    this.color,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(color: color),
    );
  }
}
