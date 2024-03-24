import 'package:flutter/material.dart';

import '../../common/widget/app_text.dart';
import '../../resources/dimens.dart';

class EmergingText extends StatelessWidget {
  final String text;
  final AnimationController ownController;

  const EmergingText({
    super.key,
    required this.text,
    required this.ownController,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: _constraint,
      child: Stack(
        children: [
          PositionedTransition(
            rect: _rectTween.animate(_animation),
            child: AppText(
              text,
              style: Theme.of(context).textTheme.displayMedium,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }

  BoxConstraints get _constraint {
    return const BoxConstraints(
      maxWidth: double.maxFinite,
      maxHeight: Dimens.k42,
    );
  }

  CurvedAnimation get _animation {
    return CurvedAnimation(parent: ownController, curve: Curves.easeIn);
  }

  RelativeRectTween get _rectTween {
    return RelativeRectTween(
      begin: RelativeRect.fromSize(
        const Rect.fromLTWH(0, Dimens.k42, double.maxFinite, Dimens.k42),
        _size,
      ),
      end: RelativeRect.fromSize(
        const Rect.fromLTWH(0, 0, double.maxFinite, Dimens.k42),
        _size,
      ),
    );
  }

  Size get _size {
    return const Size(double.maxFinite, Dimens.k42);
  }
}
