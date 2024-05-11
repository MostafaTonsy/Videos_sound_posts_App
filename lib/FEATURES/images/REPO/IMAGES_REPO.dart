import 'dart:io';

import 'package:videos_sounds_app/core/constants/links.dart';
import 'package:videos_sounds_app/core/crud/crud.dart';

class IMAGES_REPOSITORY {
  CRUD cruD;
  IMAGES_REPOSITORY({required this.cruD});
  VIEW_data(
      // {
      //  required String email,
      //}
      ) async {
    var response = await cruD.postData(
      server_images_view_DAta_link,
      {
        //     "email": email,
      },
    );
    return response;
  }

  ADD_dATA({
    //  required String email,
    required File file,
  }) async {
    var response = await cruD.postData_with_FILE(
        server_images_add_link,
        {
          //     "email": email,
        },
        file);
    return response;
  }

  DELETE_DATA({required String image_sub_url, required int image_id
      //  required String email,
      }) async {
    var response = await cruD.postData(
      server_images_delete_link,
      {
        "image_sub_url": image_sub_url,
        "image_id": image_id.toString()
        //     "email": email,
      },
    );
    return response;
  }
}
