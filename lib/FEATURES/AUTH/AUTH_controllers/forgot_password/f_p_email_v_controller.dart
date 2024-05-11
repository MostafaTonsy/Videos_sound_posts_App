// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/forgot_password/F_p_OTPverify.dart';
// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_repositories/forgot_p/f_p_email_v_repo.dart';
// import 'package:advanced_e_commerce_app/core/crud/status_request_enum.dart';
// import 'package:advanced_e_commerce_app/core/functions/handling_Data_function.dart';
// import 'package:advanced_e_commerce_app/core/utils/show_snackbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class f_p_email_v_controller extends GetxController {
//   F_p_email_v_repo f_p_email_v_repo = F_p_email_v_repo(cruD: Get.find());

//   TextEditingController email_controller = TextEditingController();
//   List data = [];
//   StatusRequest statusRequest = StatusRequest.none;
//   postdata(BuildContext context) async {
//     statusRequest = StatusRequest.loading;

//     update();
//     var response = await f_p_email_v_repo.post_data(
//       email: email_controller.text,
//     );
//     statusRequest = handling_Data_function(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == "success") {
//         Get.to(() => F_pass_OTPverify_screen(email: email_controller.text),
//             transition: Transition.upToDown);
//       } else {
//         ShowSnackbar(ERROR: 'ERROR!', context: context);
//       }
//     }
//     update();
//   }

//   @override
//   void dispose() {
//     email_controller.dispose();

//     super.dispose();
//   }
// }
