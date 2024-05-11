import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videos_sounds_app/FEATURES/posts/REPO/posts_repository.dart';
import 'package:videos_sounds_app/core/crud/status_request_enum.dart';
import 'package:videos_sounds_app/core/functions/handling_Data_function.dart';
import 'package:videos_sounds_app/core/utils/show_snackbar.dart';
import 'package:videos_sounds_app/models/POST_MODEL.dart';

class POSTS_CONTROLLER extends GetxController {
  POSTS_REPOSITORY posts_repository = POSTS_REPOSITORY(cruD: Get.find());

  List<POST_MODEL> POSTS_LIST = [];
  StatusRequest statusRequest = StatusRequest.none;

  Future<List<POST_MODEL>> view_data(
//      {
      //required String email,

      //   }

      ) async {
    statusRequest = StatusRequest.loading;

    update();

    var response = await posts_repository.VIEW_data(
        //   email: shared_p.getString("user_email"),
        );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      POSTS_LIST = [];
      if (response['status'] == "success") {
        for (var item in response['posts']) {
          final post = POST_MODEL.fromMap(item);
          POSTS_LIST.add(post);
        }
      }
    }

    update();

    return POSTS_LIST;
  }

  ADD_DATA(
      { //required String email,

      // required String post_title,
      required String post_content,
      required BuildContext context}) async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await posts_repository.ADD_dATA(
        //    post_title: post_title,

        post_content: post_content
        //   email: shared_p.getString("user_email"),
        );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
      } else {
        ShowSnackbar(ERROR: 'ERROR !', context: context);
      }
    }
    update();
  }

  DELETE_DATA(
      {required int post_id,

      //required String email,

      required BuildContext context}) async {
    statusRequest = StatusRequest.loading;

    update();
    var response = await posts_repository.DELETE_DATA(
      post_id: post_id,
      //   email: shared_p.getString("user_email"),
    );
    statusRequest = handling_Data_function(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {}
    }
    update();
  }
}
