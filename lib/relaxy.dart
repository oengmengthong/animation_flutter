// This is a playground view to make it easy to play around with Flutter Animate.

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RelaxyView extends StatelessWidget {
  const RelaxyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/logo_Relaxy.png',
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.height * 0.5,
      )
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .slideY(duration: 3.seconds, curve: Curves.easeOutCubic)
          .scale(begin: Offset(0, 0), end: Offset(2, 2))
          .fadeIn(),
    );
  }
}
