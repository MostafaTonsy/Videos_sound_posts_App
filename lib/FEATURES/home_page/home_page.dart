import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:videos_sounds_app/FEATURES/audios/VIEWS/AUDIOS_PAGE.dart';
import 'package:videos_sounds_app/FEATURES/images/VIEWS/IMAGES_PAGE.dart';
import 'package:videos_sounds_app/FEATURES/posts/VIEWS/posts_page.dart';
import 'package:videos_sounds_app/FEATURES/videos/videos_views/VIDEOS_PAGE.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';

class HOME_PAGE extends StatefulWidget {
  const HOME_PAGE({super.key});

  @override
  State<HOME_PAGE> createState() => _HOME_PAGEState();
}

class _HOME_PAGEState extends State<HOME_PAGE> {
  /* CachedVideoPlayerPlusController? cachedVideoPlayerPlusController;

  @override
  void initState() {
    cachedVideoPlayerPlusController =
        CachedVideoPlayerPlusController.networkUrl(Uri.parse(
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"))
          ..initialize().then((value) {
            cachedVideoPlayerPlusController!.setVolume(1);
          });
    super.initState();
  }

  bool is_Video_playing = false;

  @override
  void dispose() {
    cachedVideoPlayerPlusController!.dispose();
    super.dispose();
  }*/

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        canPop: false,
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 255, 255, 255)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Center(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: size_config.screen_width! * 0.42,
                            height: size_config.screen_height! * 0.42,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 254, 189),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    width: size_config.screen_width! * 0.25,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                      child: Text(
                                        'الخواطر',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const POSTS_PAGE(),
                                        transition: Transition.downToUp);
                                  },
                                  child: Container(
                                      height: size_config.screen_height! * 0.28,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                          child: LottieBuilder.asset(
                                              'assets/lottie_animations/posts.json'))),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            width: size_config.screen_width! * 0.42,
                            height: size_config.screen_height! * 0.42,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 254, 189),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    width: size_config.screen_width! * 0.25,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Center(
                                      child: Text(
                                        'الصور',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => const IMAGES_PAGE(),
                                        transition: Transition.downToUp);
                                  },
                                  child: Container(
                                      width: size_config.screen_width! * 0.38,
                                      height: size_config.screen_height! * 0.28,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: LottieBuilder.asset(
                                            'assets/lottie_animations/pic_logo.json'),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                          width: size_config.screen_width! * 0.42,
                          height: size_config.screen_height! * 0.42,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 254, 189),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(children: [
                            Center(
                              child: Container(
                                width: size_config.screen_width! * 0.25,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                  child: Text(
                                    'الفيديوهات',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const VIDEOS_PAGE(),
                                    transition: Transition.fade);
                              },
                              child: Container(
                                width: size_config.screen_width! * 0.38,
                                height: size_config.screen_height! * 0.28,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: LottieBuilder.asset(
                                    'assets/lottie_animations/video_player_icon.json'),
                              ),
                            ),
                          ])),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        width: size_config.screen_width! * 0.42,
                        height: size_config.screen_height! * 0.42,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 254, 189),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                width: size_config.screen_width! * 0.25,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                  child: Text(
                                    'الصوتيات',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const AUDIOS_PAGE(),
                                    transition: Transition.downToUp);
                              },
                              child: Container(
                                  width: size_config.screen_width! * 0.38,
                                  height: size_config.screen_height! * 0.28,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: LottieBuilder.asset(
                                          'assets/lottie_animations/audio_player.json'))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
