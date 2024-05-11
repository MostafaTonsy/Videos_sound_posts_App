import 'package:videos_sounds_app/core/constants/links.dart';
import 'package:videos_sounds_app/core/crud/crud.dart';

class POSTS_REPOSITORY {
  CRUD cruD;
  POSTS_REPOSITORY({required this.cruD});
  VIEW_data(
      // {
      //  required String email,
      //}
      ) async {
    var response = await cruD.postData(
      server_posts_view_DAta_link,
      {
        //     "email": email,
      },
    );
    return response;
  }

  ADD_dATA({
    // required String post_title,
    required String post_content,

    //  required String email,
  }) async {
    var response = await cruD.postData(
      server_posts_add_link,
      {
        //      "post_title": post_title,
        "post_content": post_content
        //     "email": email,
      },
    );
    return response;
  }

  DELETE_DATA({
    required int post_id,
    //  required String email,
  }) async {
    var response = await cruD.postData(
      server_posts_delete_link,
      {
        "post_id": post_id.toString(),
        //     "email": email,
      },
    );
    return response;
  }
}
