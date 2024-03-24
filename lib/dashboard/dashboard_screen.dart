import 'package:flutter/material.dart';
import 'package:real_estate_app/home/home_screen.dart';
import 'package:real_estate_app/location/location_screen.dart';

import '../common/screen/empty_screen.dart';
import '../common/widget/indexed_stack_control.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with TickerProviderStateMixin {
  var _index = 2;

  late final _controller1 =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedSwitcher(
            transitionBuilder: defaultTransitionBuilder,
            duration: const Duration(milliseconds: 1000),
            child: IndexedStack(
              index: _index,
              key: ValueKey<int>(_index),
              children: <Widget>[
                const LocationScreen(),
                const EmptyScreen(),
                HomeScreen(initiatorController: _controller1),
                const EmptyScreen(),
                const EmptyScreen(),
              ],
            ),
          ),
          IndexedStackControl(
            index: _index,
            ownController: _controller1,
            onPressed: (value) => setState(() => _index = value),
          ),
        ],
      ),
    );
  }

  static Widget defaultTransitionBuilder(
      Widget child, Animation<double> animation) {
    return FadeTransition(
      key: ValueKey<Key?>(child.key),
      opacity: animation,
      child: child,
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }
}
