import 'package:flutter/material.dart';
import 'package:real_estate_app/home/widget/home_app_bar.dart';

import '../common/widget/app_text.dart';
import '../resources/dimens.dart';
import 'widget/app_bottom_sheet.dart';
import 'widget/emerging_text.dart';
import 'widget/home_gradient.dart';
import 'widget/offer.dart';

class HomeScreen extends StatefulWidget {
  final AnimationController initiatorController;

  const HomeScreen({
    super.key,
    required this.initiatorController,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var _opacityLevel = 0.0;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _controller9;

  PersistentBottomSheetController? _bottomSheetController;

  late final _controller1 =
      AnimationController(duration: const Duration(seconds: 5), vsync: this);
  late final _controller2 =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);
  late final _controller3 = AnimationController(
      duration: const Duration(milliseconds: 1500), vsync: this);
  late final _controller4 = AnimationController(
      duration: const Duration(milliseconds: 1500), vsync: this);
  late final _controller6 =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);
  late final _controller7 =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);
  late final _controller8 =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);

  @override
  void initState() {
    _beginAnimations();
    _scheduleAnimations();
    _initBottomSheetCtrl();
    super.initState();
  }

  void _initBottomSheetCtrl() {
    _controller9 = BottomSheet.createAnimationController(this);
    _controller9.duration = const Duration(milliseconds: 1700);
    _controller9.reverseDuration = const Duration(seconds: 2);
  }

  @override
  Widget build(BuildContext context) {
    return HomeGradient(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: HomeAppBar(
          controller1: _controller1,
          opacityLevel: _opacityLevel,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(
              height: 40,
            ),
            FadeTransition(
              opacity:
                  CurvedAnimation(parent: _controller2, curve: Curves.linear),
              child: AppText(
                "Hi, Marina",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            EmergingText(
              text: "let's select your",
              ownController: _controller3,
            ),
            EmergingText(
              text: "perfect place",
              ownController: _controller4,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 192,
              child: Row(
                children: [
                  Expanded(
                    child: Offer(
                      row3: "offers",
                      shape: BoxShape.circle,
                      row1: "Buy".toUpperCase(),
                      ownController1: _controller6,
                      ownController2: _controller7,
                      initiatorController: _controller4,
                      backGroundColor: Theme.of(context).colorScheme.primary,
                      color: Theme.of(context).colorScheme.onPrimary,
                      animation: Tween<double>(begin: 93, end: 1034).animate(
                        CurvedAnimation(
                            parent: _controller7, curve: Curves.linear),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Offer(
                      row3: "offers",
                      shape: BoxShape.rectangle,
                      row1: "Rent".toUpperCase(),
                      ownController1: _controller6,
                      ownController2: _controller8,
                      initiatorController: _controller4,
                      radius: BorderRadius.circular(Dimens.k24),
                      color: Theme.of(context).colorScheme.secondary,
                      backGroundColor: Theme.of(context).colorScheme.background,
                      animation: Tween<double>(begin: 199, end: 2212).animate(
                        CurvedAnimation(
                            parent: _controller8, curve: Curves.linear),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _beginAnimations() {
    _controller1.forward();
  }

  void _scheduleAnimations() {
    _setListenerToBeginHintAnimation();
    _setListenerToBeginDisplay1Animation();
    _setListenerToBeginDisplay2Animation();
    _setListenerToBeginBottomSheetAnimation();
  }

  void _setListenerToBeginHintAnimation() {
    _controller1.addListener(() {
      if ((_controller1.lastElapsedDuration?.inMilliseconds ?? 0) >= 4500 &&
          _opacityLevel == 0.0) {
        setState(() => _opacityLevel = 1.0);
      }
      if (_controller1.isCompleted) _controller2.forward();
    });
  }

  void _setListenerToBeginDisplay1Animation() {
    _controller2.addListener(() {
      if ((_controller2.lastElapsedDuration?.inMilliseconds ?? 0) >= 1000) {
        _controller3.forward();
      }
    });
  }

  void _setListenerToBeginDisplay2Animation() {
    _controller3.addListener(() {
      if ((_controller3.lastElapsedDuration?.inMilliseconds ?? 0) >= 50) {
        _controller4.forward();
      }
    });
  }

  void _openBottomSheet() {
    _bottomSheetController = scaffoldKey.currentState?.showBottomSheet<void>(
      enableDrag: true,
      transitionAnimationController: _controller9,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.k24),
          topRight: Radius.circular(Dimens.k24),
        ),
      ),
      (BuildContext context) {
        return AppBottomSheet(initiatorController1: widget.initiatorController);
      },
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller6.dispose();
    _controller7.dispose();
    _controller8.dispose();
    _controller9.dispose();
    super.dispose();
  }

  void _setListenerToBeginBottomSheetAnimation() {
    _controller7.addListener(() {
      if (_controller7.isCompleted && _bottomSheetController == null) {
        _openBottomSheet();
      }
    });
  }
}
