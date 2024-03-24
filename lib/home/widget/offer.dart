import 'package:flutter/material.dart';

import '../../common/widget/app_text.dart';

class Offer extends StatefulWidget {
  final String row1;
  final String row3;
  final String? row2;
  final Color color;
  final BoxShape shape;
  final BorderRadius? radius;
  final Color backGroundColor;
  final Animation<double> animation;
  final AnimationController ownController1;
  final AnimationController ownController2;
  final AnimationController initiatorController;

  const Offer({
    super.key,
    this.row2,
    this.radius,
    required this.row1,
    required this.row3,
    required this.shape,
    required this.color,
    required this.animation,
    required this.ownController1,
    required this.ownController2,
    required this.backGroundColor,
    required this.initiatorController,
  });

  @override
  State<Offer> createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  @override
  void initState() {
    _setInitiatorControllerListener();
    _setOwnController1Listener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(
          parent: widget.ownController1, curve: Curves.decelerate),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: _boxDecoration,
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        AppText(
          widget.row1,
          color: widget.color,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 34,
        ),
        ListenableBuilder(
          listenable: widget.ownController2,
          builder: (BuildContext context, Widget? child) {
            return AppText(
              widget.row2 ?? _countDown,
              color: widget.color,
              style: Theme.of(context).textTheme.headlineLarge,
            );
          },
        ),
        const SizedBox(
          height: 4,
        ),
        AppText(
          widget.row3,
          color: widget.color,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  String get _countDown {
    final value = widget.animation.value.toInt();

    if (value >= 1000) {
      return "$value".replaceFirst("", " ", 1);
    } else {
      return "$value";
    }
  }

  BoxDecoration get _boxDecoration {
    return BoxDecoration(
      shape: widget.shape,
      borderRadius: widget.radius,
      color: widget.backGroundColor,
    );
  }

  void _setInitiatorControllerListener() {
    widget.initiatorController.addListener(() {
      if ((widget.initiatorController.lastElapsedDuration?.inMilliseconds ??
              0) >=
          500) {
        widget.ownController1.forward();
      }
    });
  }

  void _setOwnController1Listener() {
    widget.ownController1.addListener(() {
      if ((widget.ownController1.lastElapsedDuration?.inMilliseconds ?? 0) >=
          100) {
        widget.ownController2.forward();
      }
    });
  }
}
