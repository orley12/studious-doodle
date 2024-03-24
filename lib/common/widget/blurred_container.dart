import 'dart:ui';

import 'package:flutter/material.dart';

import '../../resources/dimens.dart';

class BlurredContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color? gradientColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const BlurredContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
    this.gradientColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: _boxDecoration(context),
      child: _blurEffect(context),
    );
  }

  ClipRRect _blurEffect(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(Dimens.k50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: child,
      ),
    );
  }

  BoxDecoration _boxDecoration(BuildContext context) {
    return BoxDecoration(
      gradient: _gradient(context),
      borderRadius: borderRadius ?? BorderRadius.circular(Dimens.k50),
    );
  }

  LinearGradient _gradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        gradientColor ?? Colors.white.withOpacity(0.4),
        gradientColor ?? Colors.white.withOpacity(0.4),
      ],
    );
  }
}
