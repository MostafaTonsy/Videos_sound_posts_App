import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videos_sounds_app/FEATURES/videos/videos_controller/videos_controller.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';
import 'package:videos_sounds_app/handling_DAta_view.dart/handlind_data_view.dart';
import 'package:videos_sounds_app/models/VIDEO_MODEL.dart';

class VIDEO_DETAILS_PAGE extends StatefulWidget {
  final VIDEO_MODEL video_model;
  const VIDEO_DETAILS_PAGE({
    super.key,
    required this.video_model,
  });

  @override
  State<VIDEO_DETAILS_PAGE> createState() => _VIDEO_ITEMState();
}

class _VIDEO_ITEMState extends State<VIDEO_DETAILS_PAGE> {
  CachedVideoPlayerPlusController? videoItemController;

  @override
  void initState() {
    videoItemController = CachedVideoPlayerPlusController.networkUrl(
        Uri.parse(widget.video_model.video_url))
      ..initialize().then((value) {
        videoItemController!.setVolume(1);
      });

    super.initState();
  }

  @override
  void dispose() {
    videoItemController!.dispose();

    super.dispose();
  }

  bool is_Video_playing = false;

  @override
  Widget build(BuildContext context) {
    Get.put(VIDEOS_CONTROLLER());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.yellow,
          title: const Text(
            'Video Details',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: GetBuilder<VIDEOS_CONTROLLER>(
          builder: (controller) => handling_request_view(
            status_request: controller.statusRequest,
            widget: StatefulBuilder(
              builder: (context, setState) {
                /*   if (videoItemController == null) {
              videoItemController = CachedVideoPlayerPlusController.networkUrl(
                  Uri.parse(widget.video_model.video_url))
                ..initialize().then((value) {
                  videoItemController!.setVolume(1);
                });
            } else {
              videoItemController = null;
              videoItemController = CachedVideoPlayerPlusController.networkUrl(
                  Uri.parse(widget.video_model.video_url))
                ..initialize().then((value) {
                  videoItemController!.setVolume(1);
                });
            }*/

                /*  if (cachedVideoPlayerPlusController != null) {
                                  SchedulerBinding.instance
                                      .addPostFrameCallback((timeStamp) {
                                    cachedVideoPlayerPlusController = null;
                                    // setState(() {});
                                  });
                                } else {
                            */

                // }

                return Container(
                  color: Colors.white,
                  height: size_config.screen_height!,
                  width: size_config.screen_width!,
                  padding: const EdgeInsets.all(25),
                  child: Stack(
                    children: [
                      (videoItemController != null)
                          ? CachedVideoPlayerPlus(videoItemController!)
                          : Container(
                              color: Colors.black,
                            ),
                      Center(
                        child: IconButton(
                            onPressed: () async {
                              is_Video_playing
                                  ? await videoItemController!.pause()
                                  : await videoItemController!.play();
                              setState(() {
                                is_Video_playing = !is_Video_playing;
                              });
                            },
                            icon: is_Video_playing
                                ? const Icon(
                                    Icons.pause_circle,
                                    color: Colors.white,
                                    size: 50,
                                  )
                                : const Icon(
                                    Icons.play_circle,
                                    size: 50,
                                    color: Colors.white,
                                  )),
                      ),
                      videoItemController != null
                          ? Positioned(
                              bottom: 25,
                              left: 50,
                              right: 50,
                              child: VideoProgressIndicator(
                                  videoItemController!,
                                  allowScrubbing: true))
                          : Container(
                              height: 1,
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
