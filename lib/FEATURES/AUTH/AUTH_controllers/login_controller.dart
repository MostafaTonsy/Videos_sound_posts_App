// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/forgot_password/F_p_email_v.dart';
// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_repositories/login_repository.dart';
// import 'package:advanced_e_commerce_app/FEATURES/MAIN_MARKET_PRODUCTS_PAGE.dart/views-WIDGETS/VIEWS/Main_market_products_page.dart';
// import 'package:advanced_e_commerce_app/core/crud/status_request_enum.dart';
// import 'package:advanced_e_commerce_app/core/functions/handling_Data_function.dart';
// import 'package:advanced_e_commerce_app/core/utils/show_snackbar.dart';
// import 'package:advanced_e_commerce_app/main.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Login_Controller extends GetxController {
//   LOGIN_REPOSITORY login_repository = LOGIN_REPOSITORY(cruD: Get.find());

//   TextEditingController email_controller = TextEditingController();
//   TextEditingController password_controller = TextEditingController();

//   StatusRequest statusRequest = StatusRequest.none;
//   postdata(BuildContext context) async {
//     statusRequest = StatusRequest.loading;

//     update();
//     var response = await login_repository.post_login_data(
//       email: email_controller.text,
//       password: password_controller.text,
//     );
//     statusRequest = handling_Data_function(response);

//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == "success") {
//         if (response['data']['user_approval'] == "1") {
//           shared_p.clear();
//           shared_p.setString("user_name", response['data']['user_name']);
//           shared_p.setString("user_email", response['data']['user_email']);
//           shared_p.setInt("user_phone", response['data']['user_phone']);
//           shared_p.setInt("user_id", response['data']['user_id']);
//           shared_p.setString("user_address", response['data']['user_address']);
//           shared_p.setString(
//               "user_password", response['data']['user_password']);

//           shared_p.setString("user_image", response['data']['user_image']);

//           //  //       String user_id = shared_p.getString("user_id")!;
//           //   FirebaseMessaging.instance.subscribeToTopic("users");
//           // FirebaseMessaging.instance.subscribeToTopic("users$user_id");*/

//           Get.to(() => const main_market_products_page(),
//               transition: Transition.upToDown);
//         } else {
//           Get.to(() => const FORGOT_PASSWROD_VIEW(),
//               arguments: {"email": email_controller.text},
//               transition: Transition.upToDown);
//         }
//       } else {
//         ShowSnackbar(
//             ERROR: 'Email or Password are Incorrect', context: context);
//       }
//     }
//     update();
//   }

//   login_with_google(BuildContext context) async {
//     statusRequest = StatusRequest.loading;

//     update();
//     var user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       await FirebaseAuth.instance.signOut();
//     }
//     GoogleSignIn googleSignIn = GoogleSignIn();

//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//     final googleAuth = await googleUser?.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );

//     await FirebaseAuth.instance.signInWithCredential(credential);
//     var USER = FirebaseAuth.instance.currentUser!.uid;

//     shared_p.setString("google_user_id", "1");

//     //   var googleUserId = FirebaseAuth.instance.currentUser!.uid;
//     // await login_repository.delete_google_user(google_user_id: googleUserId);

//     var response =
//         await login_repository.post_google_sign_in(google_user_id: USER);
//     statusRequest = handling_Data_function(response);

//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == "success") {
//         //  //       String user_id = shared_p.getString("user_id")!;
//         //   FirebaseMessaging.instance.subscribeToTopic("users");
//         // FirebaseMessaging.instance.subscribeToTopic("users$user_id");

//         Get.to(() => const main_market_products_page(),
//             transition: Transition.circularReveal); /*
//       }
//     }*/
//       }

//       @override
//       void dispose() {
//         email_controller.dispose();
//         password_controller.dispose();

//         super.dispose();
//       }
//     }
//   }
// }
