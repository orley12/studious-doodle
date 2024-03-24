import 'package:flutter/material.dart';
import 'package:real_estate_app/common/widget/app_text.dart';

import '../../common/widget/app_floating_action_button.dart';
import '../../common/widget/blurred_container.dart';
import '../../resources/dimens.dart';

class AppSlider extends StatefulWidget {
  final String text;
  final double buttonSize;
  final double slideWidth;
  final double elapsedTime;
  final double slideHeight;
  final void Function() onPressed;
  final AlignmentGeometry alignment;
  final AnimationController controller1;
  final AnimationController controller2;

  const AppSlider({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonSize,
    required this.slideWidth,
    required this.slideHeight,
    required this.elapsedTime,
    required this.controller1,
    required this.controller2,
    this.alignment = Alignment.center,
  });

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> with TickerProviderStateMixin {
  late final _controller1 =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));

  @override
  void initState() {
    _setListenerToBeginAddressAnimation();
    _setListenerToBeginExpansionAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [_sliderTrack(context), _address(context)],
    );
  }

  Widget _sliderTrack(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.controller2,
      builder: (BuildContext context, Widget? child) {
        return SizedBox(
          width:
              Tween<double>(begin: widget.slideHeight, end: widget.slideWidth)
                  .animate(CurvedAnimation(
                      parent: widget.controller2, curve: Curves.easeIn))
                  .value,
          child: ScaleTransition(
            alignment: Alignment.centerLeft,
            scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                parent: widget.controller1, curve: Curves.easeIn)),
            child: BlurredContainer(
              width: widget.slideHeight,
              height: widget.slideHeight,
              child: _sliderButton(context),
            ),
          ),
        );
      },
    );
  }

  Padding _address(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.k8),
      child: Align(
        alignment: widget.alignment,
        child: FadeTransition(
          opacity: CurvedAnimation(parent: _controller1, curve: Curves.linear),
          child: AppText(
            widget.text,
            style: Theme.of(context).textTheme.bodyMedium,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }

  LinearGradient gradient(BuildContext context) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Theme.of(context).colorScheme.surface.withOpacity(0.4),
        Theme.of(context).colorScheme.surface.withOpacity(0.4),
      ],
    );
  }

  Widget _sliderButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: _floatingActionButton(context),
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return AppFloatingActionButton(
      size: widget.buttonSize,
      icon: Icons.chevron_right,
      onPressed: widget.onPressed,
      color: Theme.of(context).colorScheme.onBackground,
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  void _setListenerToBeginAddressAnimation() {
    widget.controller2.addListener(() {
      if ((widget.controller2.lastElapsedDuration?.inMilliseconds ?? 0) >=
          widget.elapsedTime) {
        _controller1.forward();
      }
    });
  }

  void _setListenerToBeginExpansionAnimation() {
    widget.controller1.addListener(() {
      if (widget.controller1.isCompleted) {
        widget.controller2.forward();
      }
    });
  }
}
