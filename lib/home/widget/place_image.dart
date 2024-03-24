import 'package:flutter/material.dart';

import '../../resources/dimens.dart';
import 'slider.dart';

class PlaceImage extends StatelessWidget {
  final String text;
  final String image;
  final double? height;
  final double buttonSize;
  final double slideWidth;
  final double slideHeight;
  final double elapsedTime;
  final void Function() onPressed;
  final AlignmentGeometry alignment;
  final AnimationController controller1;
  final AnimationController controller2;

  const PlaceImage({
    super.key,
    this.height,
    required this.text,
    required this.image,
    required this.onPressed,
    required this.slideWidth,
    required this.buttonSize,
    required this.slideHeight,
    required this.controller1,
    required this.elapsedTime,
    required this.controller2,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? Dimens.k228,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: Dimens.k4, vertical: Dimens.k4),
      decoration: _boxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _slider(),
        ],
      ),
    );
  }

  Padding _slider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.k12, vertical: Dimens.k16),
      child: AppSlider(
        text: text,
        alignment: alignment,
        onPressed: onPressed,
        slideWidth: slideWidth,
        buttonSize: buttonSize,
        slideHeight: slideHeight,
        elapsedTime: elapsedTime,
        controller1: controller1,
        controller2: controller2,
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(Dimens.k24),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(image),
      ),
    );
  }
}
