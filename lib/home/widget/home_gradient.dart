import 'package:flutter/material.dart';

class HomeGradient extends StatelessWidget {
  final Widget child;

  const HomeGradient({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.background,
            Theme.of(context).colorScheme.primary,
          ],
          stops: const [0.35, 0.8],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
