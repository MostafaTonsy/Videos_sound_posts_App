import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:videos_sounds_app/FEATURES/FIREBASE_MESSAGING/CONTROLLER/FIREBASE_MESSAGING_CONTROLLER.dart';
import 'package:videos_sounds_app/FEATURES/home_page/home_page.dart';
import 'package:videos_sounds_app/FEATURES/images/CONTROLLER/IMAGES_CONTROLLER.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';
import 'package:videos_sounds_app/handling_DAta_view.dart/handlind_data_view.dart';
import 'package:videos_sounds_app/models/IMAGE_MODEL.dart';

class IMAGES_PAGE extends StatefulWidget {
  const IMAGES_PAGE({super.key});

  @override
  State<IMAGES_PAGE> createState() => _IMAGES_PAGEState();
}

class _IMAGES_PAGEState extends State<IMAGES_PAGE> {
  File? image_file;
  XFile? imagePath;
  IMAGES_CONTROLLER imagesController = Get.put(IMAGES_CONTROLLER());

  PICK_IMAGE() async {
    showModalBottomSheet(
      elevation: 30,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(7),
        height: size_config.screen_height! * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () async {
                if (imagePath != null) {
                  imagePath = null;
                } else {
                  imagePath = await ImagePicker.platform
                      .getImageFromSource(source: ImageSource.gallery);

                  if (imagePath != null) {
                    image_file = File(imagePath!.path);
                    await imagesController.ADD_dATA(file: image_file!);

                    setState(() {
                      /*  imageCache.clear();
                      image_file = null;*/
                    });
                  }
                }
              },
              child: Container(
                  height: size_config.screen_height! * 0.1,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    'Pick Image From Gallery',
                    style: TextStyle(color: Colors.yellow),
                  ))),
            ),
            GestureDetector(
              onTap: () async {
                XFile? imagePath = await ImagePicker.platform
                    .getImageFromSource(source: ImageSource.camera);

                if (imagePath != null) {
                  image_file = File(imagePath.path);
                  await imagesController.ADD_dATA(file: image_file!);

                  setState(() {});
                  /*    imageCache.clear();
                  imagePath = null;*/
                }
              },
              child: Container(
                  height: size_config.screen_height! * 0.1,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    'Pick Image From Camera',
                    style: TextStyle(color: Colors.yellow),
                  ))),
            )
          ],
        ),
      ),
    );
  }

  delete_DAta({required image_id, required image_url}) async {
    await imagesController.DELETE_DATA(
        image_id: image_id,
        image_sub_url: image_url.substring(44),
        context: context);
  }

  @override
  void initState() {
    firebasemess();
    super.initState();
  }

  firebasemess() async {
    Firebase_Messaging.fcmconfig();
    await FirebaseMessaging.instance.subscribeToTopic("users");
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
                  'الصور',
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
                        PICK_IMAGE();
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
                  color: const Color.fromARGB(255, 234, 250, 143),
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(20),
              height: size_config.screen_height! * 0.75,
              width: size_config.screen_width!,
              child: FutureBuilder<List<IMAGE_MODEL>>(
                future: imagesController.view_Data(),
                builder: (context, snapshot) => handling_request_view(
                  status_request: imagesController.statusRequest,
                  widget: // RotatedBox(
                      //quarterTurns: 1,
                      //Transform.rotate(
                      //  angle: 11,
                      //   child:
                      (imagesController.IMAGES_LIST.isEmpty)
                          ? Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                  color: Colors.white),
                              child: LottieBuilder.asset(
                                  'assets/lottie_animations/no_data.json'),
                            )
                          : ListWheelScrollView.useDelegate(
                              itemExtent: 500,
                              childDelegate: ListWheelChildBuilderDelegate(
                                  childCount:
                                      imagesController.IMAGES_LIST.length,
                                  builder: (context, index) {
                                    final imagesList =
                                        imagesController.IMAGES_LIST;
                                    final image = imagesList[index];
                                    return //RotatedBox(
                                        //    quarterTurns: -1,
                                        //    child:

                                        Stack(
                                      children: [
                                        Container(
                                          height:
                                              size_config.screen_height! * 0.8,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          child: Image.network(image.image_url),
                                        ),
                                        Positioned(
                                          top: 20,
                                          child: IconButton(
                                              onPressed: () async {
                                                delete_DAta(
                                                    image_id: image.image_id,
                                                    image_url: image.image_url);
                                                setState(() {});
                                              },
                                              icon: Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                padding:
                                                    const EdgeInsets.all(6),
                                                decoration: BoxDecoration(
                                                    color: Colors.yellow,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: const Icon(
                                                  Icons.delete_outline,
                                                  color: Color.fromARGB(
                                                      255, 0, 4, 236),
                                                ),
                                              )),
                                        ),
                                      ],
                                    );
                                    //    );
                                  } //) //),
                                  //      ),
                                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
