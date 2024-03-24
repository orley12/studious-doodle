import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final double? size;
  final Color? color;
  final dynamic image;
  final double radius;
  final Color? backgroundColor;

  const CircularImage({
    super.key,
    this.size,
    this.color,
    this.backgroundColor,
    required this.radius,
    required String this.image,
  });

  const CircularImage.icon({
    super.key,
    this.size,
    this.color,
    this.backgroundColor,
    required this.radius,
    required IconData this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        image: _image,
        shape: BoxShape.circle,
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
      ),
      child: _icon,
    );
  }

  Icon? get _icon {
    if (image is IconData) {
      return Icon(
        image,
        size: size,
        color: color,
      );
    } else {
      return null;
    }
  }

  DecorationImage? get _image {
    if (image is String) {
      return DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(image!),
      );
    } else {
      return null;
    }
  }
}
