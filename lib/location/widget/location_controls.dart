import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_octicons/flutter_octicons.dart';

import '../../common/widget/app_floating_action_button.dart';
import '../../common/widget/app_icon.dart';
import '../../common/widget/app_text.dart';
import '../../common/widget/blurred_container.dart';
import '../../common/widget/pop_up_menu.dart';
import '../../resources/dimens.dart';

class LocationControls extends StatelessWidget {
  final IconData icon;
  final AnimationController controller1;
  final AnimationController controller2;
  final void Function({IconData? icon}) togglePopUpMenu;

  const LocationControls({
    super.key,
    required this.icon,
    required this.controller1,
    required this.controller2,
    required this.togglePopUpMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomLeft,
                children: [
                  const SizedBox(
                    height: 400,
                    width: 200,
                  ),
                  ScaleTransition(
                    scale: Tween<double>(begin: 0, end: 1).animate(
                        CurvedAnimation(
                            parent: controller1, curve: Curves.fastOutSlowIn)),
                    child: AppFloatingActionButton(
                      onPressed: togglePopUpMenu,
                      icon: icon,
                    ),
                  ),
                  PopUpMenu(
                    icon: icon,
                    controller: controller2,
                    onTap: togglePopUpMenu,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Dimens.k8,
            ),
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  parent: controller1, curve: Curves.fastOutSlowIn)),
              child: AppFloatingActionButton(
                onPressed: () {},
                icon: OctIcons.paper_airplane_24,
              ),
            ),
          ],
        ),
        ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
              parent: controller1, curve: Curves.fastOutSlowIn)),
          child: BlurredContainer(
            padding: const EdgeInsets.all(Dimens.k16),
            child: Row(
              children: [
                const AppIcon(
                  size: Dimens.k24,
                  FeatherIcons.alignLeft,
                ),
                const SizedBox(
                  width: Dimens.k8,
                ),
                AppText(
                  "List of variants",
                  color: Theme.of(context).colorScheme.surface,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
