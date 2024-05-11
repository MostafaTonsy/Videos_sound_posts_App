import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videos_sounds_app/FEATURES/videos/video_repo/videos_repo.dart';
import 'package:videos_sounds_app/core/crud/status_request_enum.dart';
import 'package:videos_sounds_app/core/functions/handling_Data_function.dart';
import 'package:videos_sounds_app/core/utils/show_snackbar.dart';
import 'package:videos_sounds_app/models/VIDEO_MODEL.dart';

class VIDEOS_CONTROLLER extends GetxController {
  VIDEOS_REPOSITORY videos_repository = VIDEOS_REPOSITORY(cruD: Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<VIDEO_MODEL> videosList = [];

  Future<List<VIDEO_MODEL>> viewdata() async {
    statusRequest = StatusRequest.loading;

    videosList = [];

    update();
    var response = await videos_repository.VIEW_data();
    statusRequest = handling_Data_function(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        for (var item in response['videos']) {
          var video = VIDEO_MODEL.fromMap(item);
          videosList.add(video);
        }
      }
    }
    update();
    return videosList;
  }

  ADD_dATA(
      { //required String email,
      required File file,
      required video_name,
      required BuildContext context}) async {
    statusRequest = StatusRequest.loading;

    update();
    var response =
        await videos_repository.ADD_dATA(file: file, video_name: video_name
            //   email: shared_p.getString("user_email"),
            );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        ShowSnackbar(ERROR: 'Video Added Successfully', context: context);
      } else {
        ShowSnackbar(ERROR: 'Video Upload Error !', context: context);
      }
    }
    update();
  }

  DELETE_DATA(
      {required int video_id,
      required String video_sub_url,

      //required String email,

      required BuildContext context}) async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await videos_repository.DELETE_DATA(
      video_id: video_id,
      video_sub_url: video_sub_url,
      //   email: shared_p.getString("user_email"),
    );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        //   ShowSnackbar(ERROR: 'Video Deleted Successfully', context: context);
      } else {
        // ShowSnackbar(ERROR: ' ERROR !', context: context);
      }
    }
    update();
  }
}
