import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videos_sounds_app/FEATURES/audios/REPO/audios_repository.dart';
import 'package:videos_sounds_app/core/crud/status_request_enum.dart';
import 'package:videos_sounds_app/core/functions/handling_Data_function.dart';
import 'package:videos_sounds_app/core/utils/show_snackbar.dart';
import 'package:videos_sounds_app/models/AUDIO_MODEL.dart';

class AUDIOS_CONTROLLER extends GetxController {
  AUDIOS_REPOSITORY audios_repository = AUDIOS_REPOSITORY(cruD: Get.find());

  List<AUDIO_MODEL> AUDIOS_LIST = [];
  StatusRequest statusRequest = StatusRequest.none;

  Future<List<AUDIO_MODEL>> view_data(
//      {
      //required String email,

      //   }

      ) async {
    statusRequest = StatusRequest.loading;

    update();

    var response = await audios_repository.VIEW_data(
        //   email: shared_p.getString("user_email"),
        );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      AUDIOS_LIST = [];
      if (response['status'] == "success") {
        for (var item in response['audios']) {
          final audio = AUDIO_MODEL.fromMap(item);
          AUDIOS_LIST.add(audio);
        }
      }
    }

    update();

    return AUDIOS_LIST;
  }

  ADD_DATA(
      { //required String email,
      required File file,
      required audio_name,
      required BuildContext context}) async {
    statusRequest = StatusRequest.loading;

    update();
    var response =
        await audios_repository.ADD_dATA(file: file, audio_name: audio_name
            //   email: shared_p.getString("user_email"),
            );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        ShowSnackbar(ERROR: 'تم اضافة الملف بنجاح', context: context);
      } else {
        ShowSnackbar(ERROR: 'ERROR !', context: context);
      }
    }
    update();
  }

  DELETE_DATA(
      {required int audio_id,
      required String audio_sub_url,

      //required String email,

      required BuildContext context}) async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await audios_repository.DELETE_DATA(
        audio_id: audio_id, audio_sub_url: audio_sub_url
        //   email: shared_p.getString("user_email"),
        );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        //  ShowSnackbar(ERROR: 'Audio Deleted Successfully', context: context);
      } else {
        //    ShowSnackbar(ERROR: 'ERROR !', context: context);
      }
    }
    update();
  }

  @override
  void onInit() {
    view_data();
    super.onInit();
  }
}
