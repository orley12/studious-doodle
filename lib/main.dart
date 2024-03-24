import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'dashboard/dashboard_screen.dart';
import 'resources/themes.dart';

var mapConfig;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setMapConfig();

  runApp(App());
}

Future<void> _setMapConfig() async {
  try {
    mapConfig = await rootBundle.loadString('assets/json/map_pref.json');
  } catch (e) {
    debugPrint("$e");
  }
}

class App extends StatelessWidget {
  App({super.key});

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (_, __) => DashBoardScreen(),
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _closeKeyBoard(context),
      child: MaterialApp.router(
        title: 'RealEstateApp',
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeMode.system,
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1920, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(double.infinity, name: '4K'),
          ],
        ),
        routerConfig: _router,
      ),
    );
  }

  void _closeKeyBoard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }
  }
}
