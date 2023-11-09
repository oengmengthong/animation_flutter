// This is a playground view to make it easy to play around with Flutter Animate.

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InnovationView extends StatelessWidget {
  const InnovationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/logo_Relaxy.png',
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      )
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .slideY(
              duration: 3.seconds,
              curve: Curves.easeOutCubic,
              begin: -0.2,
              end: 0)
          .rotate(),
    );
  }
}
