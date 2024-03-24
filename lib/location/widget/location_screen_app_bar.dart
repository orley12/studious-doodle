import 'package:flutter/material.dart';
import 'package:real_estate_app/common/widget/app_text.dart';

import '../../common/widget/app_floating_action_button.dart';
import '../../common/widget/text_field.dart';
import '../../resources/dimens.dart';

class LocationScreenAppBar extends PreferredSize {
  final AnimationController controller1;

  const LocationScreenAppBar({
    super.key,
    required this.controller1,
    super.child = const SizedBox(),
    super.preferredSize = const Size(double.infinity, Dimens.k56),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimens.k124,
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _leading(context),
          const SizedBox(
            width: Dimens.k16,
          ),
          SizedBox(
            width: Dimens.k64,
            height: Dimens.k64,
            child: _trailing(context),
          ),
        ],
      ),
    );
  }

  Expanded _leading(BuildContext context) {
    return Expanded(
      child: ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: controller1, curve: Curves.fastOutSlowIn)),
        child: SizedBox(
          height: Dimens.k64,
          child: InputField(
            label: _label(context),
            prefixIcon: _prefixIcon(context),
            borderRadius: BorderRadius.circular(Dimens.k50),
          ),
        ),
      ),
    );
  }

  Widget _label(BuildContext context) {
    return AppText(
      "Saint Petersburg",
      style: Theme.of(context).textTheme.bodyMedium,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }

  Icon _prefixIcon(BuildContext context) {
    return Icon(
      Icons.search,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }

  Widget _trailing(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: controller1, curve: Curves.fastOutSlowIn)),
      child: AppFloatingActionButton(
        onPressed: () {},
        icon: Icons.settings,
        color: Theme.of(context).colorScheme.onBackground,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
