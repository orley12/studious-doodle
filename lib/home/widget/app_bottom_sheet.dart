import 'package:flutter/material.dart';
import 'package:real_estate_app/resources/dimens.dart';

import '../../resources/images.dart';
import 'place_image.dart';

class AppBottomSheet extends StatefulWidget {
  final AnimationController initiatorController1;

  const AppBottomSheet({
    super.key,
    required this.initiatorController1,
  });

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet>
    with TickerProviderStateMixin {
  late final _controller1 =
      AnimationController(vsync: this, duration: const Duration(seconds: 4));
  late final _controller2 =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));
  late final _controller3 =
      AnimationController(vsync: this, duration: const Duration(seconds: 4));
  late final _controller4 =
      AnimationController(vsync: this, duration: const Duration(seconds: 2));

  @override
  void initState() {
    _beginAnimations();
    _scheduleAnimations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimens.k4, right: Dimens.k4, top: Dimens.k16),
      child: Wrap(
        children: <Widget>[
          PlaceImage(
            onPressed: () {},
            buttonSize: 76.0,
            slideHeight: 80.0,
            elapsedTime: 1800,
            slideWidth: 80.0 * 7,
            text: "Gladkova St, 25",
            controller1: _controller1,
            controller2: _controller2,
            image: Images.get(Images.kitchen),
          ),
          Row(
            children: [
              Expanded(
                child: PlaceImage(
                  buttonSize: 60,
                  onPressed: () {},
                  slideHeight: 64.0,
                  elapsedTime: 1800,
                  height: Dimens.k456,
                  slideWidth: 64.0 * 3,
                  text: "Gubina St, 11",
                  controller1: _controller3,
                  controller2: _controller4,
                  image: Images.get(Images.cozy),
                  alignment: Alignment.centerLeft,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    PlaceImage(
                      buttonSize: 60,
                      onPressed: () {},
                      slideHeight: 64.0,
                      elapsedTime: 1800,
                      slideWidth: 64.0 * 3,
                      text: "Treleva St, 43",
                      controller1: _controller1,
                      controller2: _controller2,
                      image: Images.get(Images.room),
                      alignment: Alignment.centerLeft,
                    ),
                    PlaceImage(
                      buttonSize: 60,
                      onPressed: () {},
                      slideHeight: 64.0,
                      elapsedTime: 1800,
                      slideWidth: 64.0 * 3,
                      text: "Sedova St, 22",
                      controller1: _controller3,
                      controller2: _controller4,
                      alignment: Alignment.centerLeft,
                      image: Images.get(Images.living),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _beginAnimations() {
    _controller1.forward();
  }

  void _scheduleAnimations() {
    _setListenerToBeginButton2Animation();
    _setListenerToBeginBottomSheetAnimation();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  void _setListenerToBeginButton2Animation() {
    _controller2.addListener(() {
      if ((_controller2.lastElapsedDuration?.inMilliseconds ?? 0) >= 1440) {
        _controller3.forward();
      }
    });
  }

  void _setListenerToBeginBottomSheetAnimation() {
    _controller4.addListener(() {
      if (_controller4.isCompleted) {
        widget.initiatorController1.forward();
      }
    });
  }
}
