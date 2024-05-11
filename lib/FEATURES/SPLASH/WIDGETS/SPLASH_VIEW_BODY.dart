import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:videos_sounds_app/FEATURES/home_page/home_page.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';

class SPLASH_VIEW_BODY extends StatefulWidget {
  const SPLASH_VIEW_BODY({super.key});

  @override
  State<SPLASH_VIEW_BODY> createState() => _SPLASH_VIEW_BODYState();
}

class _SPLASH_VIEW_BODYState extends State<SPLASH_VIEW_BODY>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? Fading_Animation;

  @override
  void initState() {
    super.initState();

    navigate_to_next_page();
  }

  navigate_to_next_page() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.to(() => const HOME_PAGE(), transition: Transition.fadeIn);
      },
    );
  }

  @override
  void dispose() {
    animationController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              const Center(
                child: Text(
                  'InstaForum',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 252, 63),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(60)),
                  height: size_config.screen_height! * 0.6,
                  width: size_config.screen_width! * 0.78,
                  child: LottieBuilder.asset(
                      'assets/lottie_animations/GALLERY.json')),
            ],
          ),
          //    ),
          //      ),
        ],
      ),
    );
  }
}
