import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_icon.dart';
import 'app_text.dart';

class AppMarker extends StatefulWidget {
  final String text;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final CrossFadeState crossFadeState;
  final AnimationController controller1;

  const AppMarker({
    super.key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.text,
    required this.controller1,
    required this.crossFadeState,
  });

  @override
  State<AppMarker> createState() => _AppMarkerState();
}

class _AppMarkerState extends State<AppMarker> with TickerProviderStateMixin {
  late final _ownController1 =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);

  @override
  void initState() {
    _setListenerToBeginTextAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top,
      left: widget.left,
      right: widget.right,
      bottom: widget.bottom,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20))
            .copyWith(bottomLeft: const Radius.circular(0)),
        child: AnimatedCrossFade(
          firstChild: _firstChild(context),
          secondChild: _secondChild(context),
          crossFadeState: widget.crossFadeState,
          duration: const Duration(milliseconds: 1500),
        ),
      ),
    );
  }

  Widget _firstChild(BuildContext context) {
    return ScaleTransition(
      alignment: Alignment.bottomLeft,
      scale: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: widget.controller1, curve: Curves.linear)),
      child: Container(
        width: 112,
        height: 64,
        decoration: _decoration(context),
        child: _text(ownController1: _ownController1, widget: widget),
      ),
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: const BorderRadius.all(Radius.circular(20))
          .copyWith(bottomLeft: const Radius.circular(0)),
    );
  }

  Widget _secondChild(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: _decoration(context),
      child: _icon(context),
    );
  }

  Center _icon(BuildContext context) {
    return Center(
      child: AppIcon(
        size: 24,
        FontAwesomeIcons.building,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }

  @override
  void dispose() {
    _ownController1.dispose();
    super.dispose();
  }

  void _setListenerToBeginTextAnimation() {
    widget.controller1.addListener(() {
      if (widget.controller1.isCompleted) {
        _ownController1.forward();
      }
    });
  }
}

class _text extends StatelessWidget {
  const _text({
    super.key,
    required AnimationController ownController1,
    required this.widget,
  }) : _ownController1 = ownController1;

  final AnimationController _ownController1;
  final AppMarker widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: _ownController1, curve: Curves.linear)),
        child: AppText(
          widget.text,
          color: Theme.of(context).colorScheme.onPrimary,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
