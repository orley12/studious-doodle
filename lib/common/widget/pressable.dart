import 'package:flutter/material.dart';

// This widget converts its child to a button
class Pressable extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry padding;

  const Pressable({
    Key? key,
    this.focusNode,
    required this.child,
    required this.onTap,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          focusNode: focusNode,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
