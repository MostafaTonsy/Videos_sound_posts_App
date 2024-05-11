import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:videos_sounds_app/FEATURES/audios/CONTROLLER/audios_controller.dart';
import 'package:videos_sounds_app/FEATURES/home_page/home_page.dart';
import 'package:videos_sounds_app/core/utils/custom_text_field.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';
import 'package:videos_sounds_app/handling_DAta_view.dart/handlind_data_view.dart';
import 'package:videos_sounds_app/models/AUDIO_MODEL.dart';

class AUDIOS_PAGE extends StatefulWidget {
  const AUDIOS_PAGE({super.key});

  @override
  State<AUDIOS_PAGE> createState() => _AUDIOS_PAGEState();
}

class _AUDIOS_PAGEState extends State<AUDIOS_PAGE> {
  TextEditingController audio_nameCONTROLLER = TextEditingController();
  File? file;

  String? AUDIO_NAME;

  PICK_FILE(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SizedBox(
            height: size_config.screen_height! * 0.07,
            width: size_config.screen_width! * 0.8,
            child: CUSTOM_TEXT_FORM_FIELD(
                VALIDATOR: null,
                input_type: TextInputType.text,
                label: 'Enter Audio Name',
                suffix_icon: const Icon(Icons.auto_fix_normal_rounded),
                maxlines: 1,
                editingController: audio_nameCONTROLLER,
                obscure_text: false,
                on_changed: null)),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  AUDIO_NAME = audio_nameCONTROLLER.text;
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

    FilePickerResult? fileResult = await FilePicker.platform.pickFiles();

    if (fileResult != null) {
      PlatformFile pFile = fileResult.files.first;
      file = File(pFile.path!);
      await audiosController.ADD_DATA(
          file: file!, audio_name: AUDIO_NAME, context: context);

      setState(() {});
    }
  }

  AudioPlayer? audioPlayer;

  @override
  void initState() {
    if (audioPlayer != null) {
      audioPlayer = AudioPlayer();
    }
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer = null;
    super.dispose();
  }

  AUDIOS_CONTROLLER audiosController = Get.put(AUDIOS_CONTROLLER());

  bool is_audio_playing = false;

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
                  'الملفات الصوتية',
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
                        PICK_FILE(context);
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
              child: FutureBuilder<List<AUDIO_MODEL>>(
                future: audiosController.view_data(),
                builder: (context, snapshot) => handling_request_view(
                  status_request: audiosController.statusRequest,
                  widget: // RotatedBox(
                      //quarterTurns: 1,
                      //Transform.rotate(
                      //  angle: 11,
                      //   child:
                      (audiosController.AUDIOS_LIST.isEmpty)
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
                                      audiosController.AUDIOS_LIST.length,
                                  builder: (context, index) {
                                    final audiosList =
                                        audiosController.AUDIOS_LIST;
                                    final audio = audiosList[index];
                                    return //RotatedBox(
                                        //    quarterTurns: -1,
                                        //    child:

                                        Stack(
                                      children: [
                                        Container(
                                          color: Colors.black,
                                          child: Center(
                                              child: Image.asset(
                                                  'assets/sound_vibrations.jpg')),
                                        ),
                                        Center(
                                          child: IconButton(
                                              onPressed: () async {
                                                if (is_audio_playing) {
                                                  if (audioPlayer == null) {
                                                    audioPlayer = AudioPlayer();
                                                    await audioPlayer!.pause();
                                                  }

                                                  await audioPlayer!.pause();
                                                } else {
                                                  if (audioPlayer == null) {
                                                    audioPlayer = AudioPlayer();
                                                    audioPlayer!.play(UrlSource(
                                                        audio.audio_url));
                                                  }
                                                  audioPlayer!.play(UrlSource(
                                                      audio.audio_url));
                                                }

                                                setState(() {
                                                  is_audio_playing =
                                                      !is_audio_playing;
                                                });
                                              },
                                              icon: is_audio_playing
                                                  ? const Icon(
                                                      Icons.pause_circle,
                                                      size: 50,
                                                      color: Colors.white,
                                                    )
                                                  : const Icon(
                                                      Icons.play_circle,
                                                      color: Colors.white,
                                                      size: 50)),
                                        ),
                                        Positioned(
                                          top: 20,
                                          child: GestureDetector(
                                              onTap: () async {
                                                await audiosController
                                                    .DELETE_DATA(
                                                        audio_id:
                                                            audio.audio_id,
                                                        audio_sub_url: audio
                                                            .audio_url
                                                            .substring(44),
                                                        context: context);
                                                setState(() {});
                                              },
                                              child: Container(
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
