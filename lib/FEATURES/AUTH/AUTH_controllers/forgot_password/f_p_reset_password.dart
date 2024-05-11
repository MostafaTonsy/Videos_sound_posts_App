// // ignore_for_file: camel_case_types, non_constant_identifier_names

// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/login_view_page.dart';
// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_repositories/forgot_p/f_p_reset_password.dart';
// import 'package:advanced_e_commerce_app/core/crud/status_request_enum.dart';
// import 'package:advanced_e_commerce_app/core/functions/handling_Data_function.dart';
// import 'package:advanced_e_commerce_app/core/utils/show_snackbar.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class f_p_reset_password_controller extends GetxController {
//   F_p_reset_password_repo f_p_reset_password_repo =
//       F_p_reset_password_repo(cruD: Get.find());

//   TextEditingController email_controller = TextEditingController();
//   TextEditingController password_controller = TextEditingController();
//   TextEditingController re_password_controller = TextEditingController();

//   List data = [];
//   StatusRequest statusRequest = StatusRequest.none;
//   postdata(BuildContext context) async {
//     if (password_controller.text == re_password_controller.text) {
//       AwesomeDialog(
//           context: context,
//           btnCancel: TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Center(child: Text('OK')),
//           )).show();
//     }
//     statusRequest = StatusRequest.loading;

//     update();
//     var response = await f_p_reset_password_repo.post_data(
//       email: email_controller.text,
//       password: password_controller.text,
//     );
//     statusRequest = handling_Data_function(response);
//     if (statusRequest == StatusRequest.success) {
//       if (response['status'] == "success") {
//         Get.to(() => const login_view_page(), transition: Transition.upToDown);
//       } else {
//         ShowSnackbar(ERROR: 'Error!', context: context);
//       }
//     }
//     update();
//   }

//   @override
//   void dispose() {
//     email_controller.dispose();
//     re_password_controller.dispose();
//     password_controller.dispose();

//     super.dispose();
//   }
// }
