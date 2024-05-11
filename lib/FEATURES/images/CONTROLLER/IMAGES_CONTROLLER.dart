import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videos_sounds_app/FEATURES/images/REPO/IMAGES_REPO.dart';
import 'package:videos_sounds_app/core/crud/status_request_enum.dart';
import 'package:videos_sounds_app/core/functions/handling_Data_function.dart';
import 'package:videos_sounds_app/models/IMAGE_MODEL.dart';

class IMAGES_CONTROLLER extends GetxController {
  IMAGES_REPOSITORY images_repository = IMAGES_REPOSITORY(cruD: Get.find());

  List<IMAGE_MODEL> IMAGES_LIST = [];

  List<String> image_urls_list = [];

  StatusRequest statusRequest = StatusRequest.none;
  Future<List<IMAGE_MODEL>> view_Data(
      //required String email,

      ) async {
    statusRequest = StatusRequest.loading;
    IMAGES_LIST = [];

    update();
    var response = await images_repository.VIEW_data(
        //   email: shared_p.getString("user_email"),
        );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        for (var item in response['images']) {
          final image = IMAGE_MODEL.fromMap(item);
          IMAGES_LIST.add(image);
          image_urls_list.add(image.image_url);
        }
      }
    }
    update();

    return IMAGES_LIST;
  }

  ADD_dATA({
    //required String email,
    required File file,
  }) async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await images_repository.ADD_dATA(file: file
        //   email: shared_p.getString("user_email"),
        );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        //     ShowSnackbar(ERROR: 'Image Added Successfully', context: context);
      } else {
        //    ShowSnackbar(ERROR: 'Image Upload Error !', context: context);
      }
    }
    update();
  }

  DELETE_DATA(
      { //required String email,
      required int image_id,
      required String image_sub_url,
      required BuildContext context}) async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await images_repository.DELETE_DATA(
        image_id: image_id, image_sub_url: image_sub_url
        //   email: shared_p.getString("user_email"),
        );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // ShowSnackbar(ERROR: 'Image Deleted Successfully', context: context);
      } else {
        //    ShowSnackbar(ERROR: ' ERROR !', context: context);
      }
    }
    update();
  }

  REFRESH() {
    update();
  }
}
