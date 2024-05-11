import 'dart:io';

import 'package:videos_sounds_app/core/constants/links.dart';
import 'package:videos_sounds_app/core/crud/crud.dart';

class VIDEOS_REPOSITORY {
  CRUD cruD;
  VIDEOS_REPOSITORY({required this.cruD});
  VIEW_data(
      // {
      //  required String email,
      //}
      ) async {
    var response = await cruD.postData(
      server_videos_view_DAta_link,
      {
        //     "email": email,
      },
    );
    return response;
  }

  ADD_dATA({
    //  required String email,
    required String video_name,
    required File file,
  }) async {
    var response = await cruD.postData_with_FILE(
        server_videos_add_link,
        {
          "video_name": video_name
          //     "email": email,
        },
        file);
    return response;
  }

  DELETE_DATA({required String video_sub_url, required int video_id
      //  required String email,
      }) async {
    var response = await cruD.postData(
      server_videos_delete_link,
      {
        "video_sub_url": video_sub_url,
        "video_id": video_id.toString()
        //     "email": email,
      },
    );
    return response;
  }
}
