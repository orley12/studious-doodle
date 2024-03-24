import 'package:flutter/material.dart';
import 'package:real_estate_app/resources/dimens.dart';

import '../../common/widget/circular_image.dart';
import '../../common/widget/text_field.dart';
import '../../resources/images.dart';

class HomeAppBar extends PreferredSize {
  final double opacityLevel;
  final AnimationController controller1;

  const HomeAppBar({
    super.key,
    required this.controller1,
    required this.opacityLevel,
    super.child = const SizedBox(),
    super.preferredSize = const Size(double.infinity, Dimens.k56),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      title: _leading(context),
      actions: _trailing(context),
      backgroundColor: Colors.transparent,
    );
  }

  Widget _leading(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.k16),
      child: SizeTransition(
        axisAlignment: -1,
        axis: Axis.horizontal,
        sizeFactor: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller1, curve: Curves.linear),
        ),
        child: SizedBox(
          width: 215,
          height: 56,
          child: Padding(
            padding: const EdgeInsets.only(left: Dimens.k16),
            child: InputField(
              label: _label(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacityLevel,
      duration: const Duration(seconds: 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const Icon(
              Icons.location_on_rounded,
              size: 20,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Saint Petersburg",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _trailing(BuildContext context) {
    return [
      ScaleTransition(
        scale:
            CurvedAnimation(parent: controller1, curve: Curves.fastOutSlowIn),
        child: CircularImage(
          radius: Dimens.k64,
          image: Images.get(Images.photo),
        ),
      ),
      const SizedBox(
        width: Dimens.k16,
      )
    ];
  }
}
