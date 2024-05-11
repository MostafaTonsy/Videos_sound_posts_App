// // ignore_for_file: camel_case_types, non_constant_identifier_names

// import 'dart:io';

// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/login_view_page.dart';
// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/otp_screen.dart';
// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_repositories/SIGN_UP_REPOSITORY.dart';
// import 'package:advanced_e_commerce_app/core/crud/status_request_enum.dart';
// import 'package:advanced_e_commerce_app/core/functions/handling_Data_function.dart';
// import 'package:advanced_e_commerce_app/core/utils/show_snackbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Signup_controller extends GetxController {
//   SIGNUP_REPOSITORY signup_repository = SIGNUP_REPOSITORY(cruD: Get.find());

//   TextEditingController name_controller = TextEditingController();
//   TextEditingController email_controller = TextEditingController();
//   TextEditingController password_controller = TextEditingController();
//   TextEditingController address_controller = TextEditingController();
//   TextEditingController phonenumber_controller = TextEditingController();

//   List data = [];
//   StatusRequest statusRequest = StatusRequest.none;
//   postdata({required BuildContext context, required File file}) async {
//     statusRequest = StatusRequest.loading;

//     update();
//     var response = await signup_repository.post_SIGNUP_data(
//       file: file,
//       email: email_controller.text,
//       password: password_controller.text,
//       phone_number: phonenumber_controller.text,
//       username: name_controller.text,
//       address: address_controller.text,
//     );
//     statusRequest = handling_Data_function(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == "success") {
//         Get.to(() => otp_verification_screen(email: email_controller.text),
//             transition: Transition.upToDown);
//       } else {
//         ShowSnackbar(
//             ERROR: 'Email or Phone Number already exist', context: context);
//         Future.delayed(const Duration(seconds: 1), () {
//           Get.to(() => const login_view_page(),
//               transition: Transition.cupertino);
//         });
//       }
//     }
//     update();
//   }

//   @override
//   void dispose() {
//     name_controller.dispose();
//     phonenumber_controller.dispose();
//     address_controller.dispose();
//     email_controller.dispose();
//     password_controller.dispose();

//     super.dispose();
//   }
// }
