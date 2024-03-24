import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:real_estate_app/common/widget/pressable.dart';

import '../../resources/dimens.dart';
import 'blurred_container.dart';
import 'pop_up_menu_item.dart';

class PopUpMenu extends StatelessWidget {
  final IconData icon;
  final AnimationController controller;
  final void Function({IconData? icon}) onTap;

  const PopUpMenu({
    super.key,
    required this.icon,
    required this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 1,
      child: ScaleTransition(
        alignment: Alignment.bottomLeft,
        scale: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn)),
        child: BlurredContainer(
          padding: const EdgeInsets.all(Dimens.k8),
          borderRadius: BorderRadius.circular(Dimens.k24),
          gradientColor: Theme.of(context).colorScheme.surface.withOpacity(0.9),
          child: Container(
            color: Platform.isAndroid ? Colors.white : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PopUpMenuItem(
                  trailing: "Cosy areas",
                  leading: FeatherIcons.shield,
                  isSelected: icon == FeatherIcons.shield,
                  onTap: () => onTap(icon: FeatherIcons.shield),
                ),
                PopUpMenuItem(
                  trailing: "Price",
                  leading: Ionicons.wallet_outline,
                  isSelected: icon == Ionicons.wallet_outline,
                  onTap: () => onTap(icon: Ionicons.wallet_outline),
                ),
                PopUpMenuItem(
                  trailing: "Infrastructure",
                  leading: FontAwesomeIcons.basketShopping,
                  isSelected: icon == FontAwesomeIcons.basketShopping,
                  onTap: () => onTap(icon: FontAwesomeIcons.basketShopping),
                ),
                PopUpMenuItem(
                  leading: OctIcons.stack_24,
                  trailing: "Without any layer",
                  isSelected: icon == OctIcons.stack_24,
                  onTap: () => onTap(icon: OctIcons.stack_24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
