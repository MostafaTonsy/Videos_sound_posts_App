// // ignore_for_file: camel_case_types, non_constant_identifier_names

// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/login_view_page.dart';
// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_repositories/verify_code_repository.dart';
// import 'package:advanced_e_commerce_app/core/crud/status_request_enum.dart';
// import 'package:advanced_e_commerce_app/core/functions/handling_Data_function.dart';
// import 'package:advanced_e_commerce_app/core/utils/show_snackbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class verify_code_sign_up_controller extends GetxController {
//   verify_code_REPOSITORY Verify_Code_REPOSITORY =
//       verify_code_REPOSITORY(cruD: Get.find());

//   TextEditingController textEditingController = TextEditingController();

//   List data = [];
//   StatusRequest statusRequest = StatusRequest.none;
//   go_to_main_page(
//       {required String verification_code,
//       required String email,
//       required BuildContext context}) async {
//     statusRequest = StatusRequest.loading;

//     update();
//     var response = await Verify_Code_REPOSITORY.post_data(
//         email: email, verify_code: verification_code);
//     statusRequest = handling_Data_function(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == "success") {
//         Get.to(() => const login_view_page(), transition: Transition.upToDown);
//       } else {
//         ShowSnackbar(
//             ERROR: 'ERROR! Verification Code Is Incorrect', context: context);
//       }
//     }
//     update();
//   }

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     super.dispose();
//   }
// }
