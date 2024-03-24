import 'package:flutter/material.dart';

import '../../resources/dimens.dart';
import 'app_icon.dart';
import 'app_text.dart';
import 'pressable.dart';

class PopUpMenuItem extends StatelessWidget {
  final bool isSelected;
  final String trailing;
  final IconData leading;
  final void Function()? onTap;

  const PopUpMenuItem({
    super.key,
    this.onTap,
    required this.leading,
    required this.trailing,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onTap: onTap,
      child: SizedBox(
        height: 59,
        width: 220,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              AppIcon(
                leading,
                color: _color(context),
              ),
              const SizedBox(
                width: Dimens.k8,
              ),
              AppText(
                trailing,
                color: _color(context),
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ),
    );
  }

  Color _color(BuildContext context) {
    if (isSelected) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return Theme.of(context).colorScheme.onSurface;
    }
  }
}
