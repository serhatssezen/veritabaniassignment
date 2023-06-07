import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 100.0, end: 200.0), // 100.0 to 200.0
      duration: const Duration(seconds: 1), // for 1 second
      builder: (context, value, _) {
        return child;
      },
      onCompleted: () {
        // do something ...
      },
    );
  }
}
