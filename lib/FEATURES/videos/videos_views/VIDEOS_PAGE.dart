import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:videos_sounds_app/FEATURES/home_page/home_page.dart';
import 'package:videos_sounds_app/FEATURES/videos/videos_controller/videos_controller.dart';
import 'package:videos_sounds_app/FEATURES/videos/videos_views/VIDEO_DETAILS_PAGE.dart';
import 'package:videos_sounds_app/core/utils/custom_text_field.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';
import 'package:videos_sounds_app/handling_DAta_view.dart/handlind_data_view.dart';
import 'package:videos_sounds_app/models/VIDEO_MODEL.dart';

class VIDEOS_PAGE extends StatefulWidget {
  const VIDEOS_PAGE({super.key});

  @override
  State<VIDEOS_PAGE> createState() => _VIDEOS_PAGEState();
}

class _VIDEOS_PAGEState extends State<VIDEOS_PAGE> {
  /* @override
  void initState() {
    for (var video in videosController.videosList) {
      cachedVideoPlayerPlusController =
          CachedVideoPlayerPlusController.networkUrl(Uri.parse(video.video_url))
            ..initialize().then((value) {
              cachedVideoPlayerPlusController!.setVolume(1);
              setState(() {});
            });
    }

    super.initState();
  }*/

  // @override
  // void dispose() {
  //   if (videoItemController != null) {
  //     videoItemController!.dispose();
  //   }
  //   super.dispose();
  // }
  TextEditingController video_nameCONTROLELR = TextEditingController();

  VIDEOS_CONTROLLER videosController = Get.put(VIDEOS_CONTROLLER());

  File? video_file;
  String? video_name;

  PICK_VIDEO(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
            height: size_config.screen_height! * 0.07,
            width: size_config.screen_width! * 0.8,
            child: CUSTOM_TEXT_FORM_FIELD(
                VALIDATOR: null,
                input_type: TextInputType.text,
                label: 'Enter Video Name',
                suffix_icon: const Icon(Icons.auto_fix_normal_rounded),
                maxlines: 1,
                editingController: video_nameCONTROLELR,
                obscure_text: false,
                on_changed: null)),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  video_name = video_nameCONTROLELR.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel')),
        ],
      ),
    );

    XFile? videoPath =
        await ImagePicker.platform.getVideo(source: ImageSource.gallery);
    if (videoPath != null) {
      video_file = File(videoPath.path);
      await videosController.ADD_dATA(
          video_name: video_name, context: context, file: video_file!);
    }

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(15)),
              child: const Center(
                child: Text(
                  'الفيديوهات',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    child: GestureDetector(
                      onTap: () async {
                        PICK_VIDEO(context);
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.yellow,
                        size: 25,
                      ),
                    )),
                Container(
                  height: size_config.screen_height! * 0.06,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)),
                  child: GestureDetector(
                      onTap: () async {
                        Get.to(() => const HOME_PAGE());
                      },
                      child: const Icon(
                        color: Colors.yellow,
                        Icons.home,
                        size: 25,
                      )),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(15),
              height: size_config.screen_height! * 0.8,
              width: size_config.screen_width!,
              child: FutureBuilder<List<VIDEO_MODEL>>(
                future: videosController.viewdata(),
                builder: (context, snapshot) => handling_request_view(
                  status_request: videosController.statusRequest,
                  widget: // RotatedBox(
                      //quarterTurns: 1,

                      //Transform.rotate(
                      //  angle: 11,
                      //      child:

                      ListView.builder(
                          itemCount: videosController.videosList.length,
                          itemBuilder: (context, index) {
                            final videosList = videosController.videosList;
                            final video = videosList[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(() =>
                                    VIDEO_DETAILS_PAGE(video_model: video));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                width: size_config.screen_width! * 0.8,
                                height: size_config.screen_height! * 0.28,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 245, 222, 22)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size_config.screen_height! * 0.18,
                                      child: LottieBuilder.asset(
                                          'assets/lottie_animations/video_player_icon.json'),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          color:
                                              Color.fromARGB(255, 217, 255, 0),
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                25)),
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                  child: Text(
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    video.video_name,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                await videosController
                                                    .DELETE_DATA(
                                                        video_id:
                                                            video.video_id,
                                                        video_sub_url: video
                                                            .video_url
                                                            .substring(44),
                                                        context: context);
                                                setState(() {});
                                              },
                                              child: Container(
                                                  width: size_config
                                                          .screen_width! *
                                                      0.15,
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                25)),
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                  ),
                                                  child:
                                                      const Icon(Icons.delete)),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            );
                          }),
                  //     ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
