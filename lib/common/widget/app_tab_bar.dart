import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

import '../../resources/dimens.dart';
import 'circular_image.dart';

class AppTabBar extends StatefulWidget {
  final int index;
  final void Function(int)? onPressed;

  const AppTabBar({
    super.key,
    this.onPressed,
    required this.index,
  });

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      dividerHeight: 0,
      onTap: widget.onPressed,
      indicatorPadding: EdgeInsets.zero,
      indicatorWeight: double.minPositive,
      controller: TabController(length: 5, vsync: this),
      tabs: _tabs.asMap().map(_toTabItem).values.toList(),
      indicatorColor: Theme.of(context).colorScheme.onBackground,
    );
  }

  MapEntry<int, CircularImage> _toTabItem(int i, IconData e) {
    return MapEntry(
      i,
      CircularImage.icon(
        image: e,
        size: _size(i),
        radius: Dimens.k56,
        backgroundColor: _backgroundColor(i),
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }

  double _size(int i) {
    if (i == widget.index) {
      return Dimens.k32;
    } else {
      return Dimens.k24;
    }
  }

  Color _backgroundColor(int i) {
    if (i == widget.index) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return Theme.of(context).colorScheme.inverseSurface;
    }
  }

  List<IconData> get _tabs {
    return [
      OctIcons.search_24,
      CommunityMaterialIcons.message_processing,
      CommunityMaterialIcons.home_lightbulb,
      Icons.favorite,
      Icons.person,
    ];
  }
}
