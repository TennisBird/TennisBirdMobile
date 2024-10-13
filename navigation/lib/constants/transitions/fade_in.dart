import 'dart:ui';

import 'package:flutter/material.dart';

class FadeIn extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  const FadeIn({
    super.key,
    required this.child,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 10 * (1 - animation.value),
            sigmaY: 10 * (1 - animation.value)),
        child: child,
      ),
    );
  }
}
