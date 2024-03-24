import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/common/widget/app_text.dart';
import 'package:real_estate_app/common/widget/blurred_container.dart';
import 'package:real_estate_app/resources/dimens.dart';

import '../common/widget/app_floating_action_button.dart';
import '../common/widget/app_icon.dart';
import '../common/widget/app_marker.dart';
import '../common/widget/pop_up_menu.dart';
import '../main.dart';
import 'widget/location_controls.dart';
import 'widget/location_screen_app_bar.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with TickerProviderStateMixin {
  var _icon = OctIcons.stack_24;
  var _crossFadeState = CrossFadeState.showFirst;

  final _mapController = Completer<GoogleMapController>();
  final _kGooglePlex =
      const CameraPosition(zoom: 15.4746, target: LatLng(52.485132, -1.908445));

  late final _controller1 =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);
  late final _controller2 = AnimationController(
      duration: const Duration(milliseconds: 1500), vsync: this);
  late final _controller3 =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);

  @override
  void initState() {
    _beginAnimations();
    _scheduleAnimations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _map(),
          ..._markers,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.k24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocationScreenAppBar(controller1: _controller1),
                Column(
                  children: [
                    LocationControls(
                      icon: _icon,
                      controller1: _controller1,
                      controller2: _controller2,
                      togglePopUpMenu: _togglePopUpMenu,
                    ),
                    const SizedBox(
                      height: 136,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get _markers {
    return [
      AppMarker(
        top: 216,
        left: 110,
        text: "10,3 mn ₽",
        controller1: _controller3,
        crossFadeState: _crossFadeState,
      ),
      AppMarker(
        top: 296,
        left: 134,
        text: "11 mn ₽",
        controller1: _controller3,
        crossFadeState: _crossFadeState,
      ),
      AppMarker(
        top: 328,
        right: 24,
        text: "7,8 mn ₽",
        controller1: _controller3,
        crossFadeState: _crossFadeState,
      ),
      AppMarker(
        top: 464,
        right: 24,
        text: "8,5 mn ₽",
        controller1: _controller3,
        crossFadeState: _crossFadeState,
      ),
      AppMarker(
        top: 488,
        left: 70,
        text: "13,3 mn ₽",
        controller1: _controller3,
        crossFadeState: _crossFadeState,
      ),
      AppMarker(
        top: 584,
        right: 70,
        text: "6,95 mn ₽",
        controller1: _controller3,
        crossFadeState: _crossFadeState,
      ),
    ];
  }

  Widget _map() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        controller.setMapStyle(mapConfig);
        _mapController.complete(controller);
      },
    );
  }

  void _togglePopUpMenu({IconData? icon}) {
    if (icon == null) {
      _setCrossFadeState(CrossFadeState.showFirst);
      _controller2.forward();
    } else {
      _setIcon(icon);
      _setCrossFadeState(CrossFadeState.showSecond);
      _controller2.reverse();
    }
  }

  void _setIcon(IconData icon) {
    setState(() => _icon = icon);
  }

  void _setCrossFadeState(CrossFadeState state) {
    setState(() => _crossFadeState = state);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  void _beginAnimations() {
    _controller1.forward();
  }

  void _scheduleAnimations() {
    _setListenerToBeginMarkerAnimation();
  }

  void _setListenerToBeginMarkerAnimation() {
    _controller1.addListener(() {
      if (_controller1.isCompleted) {
        _controller3.forward();
      }
    });
  }
}
