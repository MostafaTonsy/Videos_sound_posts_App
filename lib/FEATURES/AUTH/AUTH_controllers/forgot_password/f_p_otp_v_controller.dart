// // ignore_for_file: camel_case_types, non_constant_identifier_names

// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/forgot_password/F_P_reset_password.dart';
// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_repositories/forgot_p/f_p_otp_v.dart';
// import 'package:advanced_e_commerce_app/core/crud/status_request_enum.dart';
// import 'package:advanced_e_commerce_app/core/functions/handling_Data_function.dart';
// import 'package:advanced_e_commerce_app/core/utils/show_snackbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class f_p_otp_v_controller extends GetxController {
//   F_pass_otp_verification_repo f_pass_otp_verification_repo =
//       F_pass_otp_verification_repo(cruD: Get.find());

//   TextEditingController email_controller = TextEditingController();
//   TextEditingController password_controller = TextEditingController();
//   List data = [];
//   StatusRequest statusRequest = StatusRequest.none;
//   postdata(
//       {required BuildContext context,
//       required String verify_code,
//       required String email}) async {
//     statusRequest = StatusRequest.loading;

//     update();
//     var response = await f_pass_otp_verification_repo.post_data(
//       email: email,
//       verifycode: verify_code,
//     );
//     statusRequest = handling_Data_function(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == "success") {
//         Get.to(() => const F_P_reset_password_screen(),
//             transition: Transition.upToDown);
//       } else {
//         ShowSnackbar(
//             ERROR: 'Error verification code incorrect', context: context);
//       }
//     }
//     update();
//   }

//   @override
//   void dispose() {
//     email_controller.dispose();
//     password_controller.dispose();

//     super.dispose();
//   }
// }
