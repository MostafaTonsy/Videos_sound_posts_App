import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LOADING_Container extends StatelessWidget {
  const LOADING_Container({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: LottieBuilder.asset(
            'assets/lottie_animations/loading_hand.json',
            reverse: true,
            animate: true,
          )),
    );
  }
}
