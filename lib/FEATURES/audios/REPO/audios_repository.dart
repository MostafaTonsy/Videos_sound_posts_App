import 'dart:io';

import 'package:videos_sounds_app/core/constants/links.dart';
import 'package:videos_sounds_app/core/crud/crud.dart';

class AUDIOS_REPOSITORY {
  CRUD cruD;
  AUDIOS_REPOSITORY({required this.cruD});
  VIEW_data(
      // {
      //  required String email,
      //}
      ) async {
    var response = await cruD.postData(
      server_audios_view_DAta_link,
      {
        //     "email": email,
      },
    );
    return response;
  }

  ADD_dATA({
    required File file,
    required String audio_name,
    //  required String email,
  }) async {
    var response = await cruD.postData_with_FILE(
        server_audios_add_link,
        {
          "audio_name": audio_name
          //     "email": email,
        },
        file);
    return response;
  }

  DELETE_DATA({required int audio_id, required String audio_sub_url
      //  required String email,
      }) async {
    var response = await cruD.postData(
      server_audios_delete_link,
      {
        "audio_id": audio_id.toString(),
        "audio_sub_url": audio_sub_url
        //     "email": email,
      },
    );
    return response;
  }
}
