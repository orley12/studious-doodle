import 'package:flutter/material.dart';

import '../../resources/dimens.dart';
import 'app_tab_bar.dart';

class IndexedStackControl extends StatelessWidget {
  final int index;
  final AnimationController ownController;
  final void Function(dynamic value) onPressed;

  const IndexedStackControl({
    super.key,
    required this.index,
    required this.onPressed,
    required this.ownController,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ownController,
      builder: (_, __) {
        return Positioned(
          bottom: Tween<double>(begin: -Dimens.k64, end: Dimens.k48)
              .animate(
                  CurvedAnimation(parent: ownController, curve: Curves.easeOut))
              .value,
          child: Container(
            height: Dimens.k64,
            width: 400,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(Dimens.k50),
            ),
            margin: const EdgeInsets.symmetric(horizontal: Dimens.k24),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.k50),
              child: AppTabBar(
                index: index,
                onPressed: onPressed,
              ),
            ),
          ),
        );
      },
    );
  }
}
