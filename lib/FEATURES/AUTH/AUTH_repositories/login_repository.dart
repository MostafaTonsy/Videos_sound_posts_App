// import 'package:advanced_e_commerce_app/core/constants/links.dart';
// import 'package:advanced_e_commerce_app/core/crud/crud.dart';

// class LOGIN_REPOSITORY {
//   CRUD cruD;
//   LOGIN_REPOSITORY({required this.cruD});
//   post_login_data({
//     required String email,
//     required String password,
//   }) async {
//     var response = await cruD.postData(server_login_link, {
//       "user_email": email,
//       "user_password": password,
//     });
//     return response;
//   }

//   post_google_sign_in({required String google_user_id}) async {
//     var response = await cruD
//         .postData(server_google_sign_in, {"google_user_id": google_user_id});
//     return response;
//   }

//   delete_google_user({required String google_user_id}) async {
//     var response = await cruD.postData(
//         server_google_user_delete, {"google_user_id": google_user_id});
//     return response;
//   }
// }
