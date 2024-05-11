// import 'dart:io';

// import 'package:advanced_e_commerce_app/core/constants/links.dart';
// import 'package:advanced_e_commerce_app/core/crud/crud.dart';

// class SIGNUP_REPOSITORY {
//   CRUD cruD;
//   SIGNUP_REPOSITORY({required this.cruD});
//   post_SIGNUP_data(
//       {required String username,
//       required String password,
//       required String address,
//       required String email,
//       required File file,
//       required String phone_number}) async {
//     var response = await cruD.postData_with_FILE(
//         server_signup_link,
//         {
//           "user_name": username,
//           "user_password": password,
//           "user_email": email,
//           "user_phone": phone_number,
//           "user_address": address,
//         },
//         file);
//     return response;
//   }
// }
