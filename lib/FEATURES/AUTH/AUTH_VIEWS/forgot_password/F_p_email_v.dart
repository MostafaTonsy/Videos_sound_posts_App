// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/login_view_page.dart';
// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_controllers/forgot_password/f_p_email_v_controller.dart';
// import 'package:advanced_e_commerce_app/FEATURES/handling_DAta_view.dart/handlind_data_view.dart';
// import 'package:advanced_e_commerce_app/core/constants/Colors.dart';
// import 'package:advanced_e_commerce_app/core/functions/validator_function.dart';
// import 'package:advanced_e_commerce_app/core/utils/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';

// class FORGOT_PASSWROD_VIEW extends ConsumerStatefulWidget {
//   const FORGOT_PASSWROD_VIEW({super.key});

//   @override
//   ConsumerState<FORGOT_PASSWROD_VIEW> createState() =>
//       _FORGOT_PASSWROD_VIEWState();
// }

// class _FORGOT_PASSWROD_VIEWState extends ConsumerState<FORGOT_PASSWROD_VIEW> {
//   GlobalKey<FormState> form_key = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     Get.put(f_p_email_v_controller());
//     return Scaffold(
//       backgroundColor: purple_dark,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: purple_dark,
//         foregroundColor: Colors.yellow,
//         title: const Text(
//           'E-mail Verification ',
//           style: TextStyle(color: Colors.white, fontSize: 17),
//         ),
//       ),
//       body: GetBuilder<f_p_email_v_controller>(
//         builder: (controller) => handling_request_view(
//           status_request: controller.statusRequest,
//           widget: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 15),
//             padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
//             child: Form(
//               key: form_key,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   const Text(
//                     'Please Write Your E-mail and We will send a Verification Code',
//                     style: TextStyle(fontSize: 12, color: YELLOW_COLOR),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     height: 38,
//                     child: CUSTOM_TEXT_FORM_FIELD(
//                       VALIDATOR: (value) {
//                         if (!GetUtils.isEmail(value!)) {
//                           return "Invalid Email";
//                         } else {
//                           return validinput(value, 3, 50);
//                         }
//                       },
//                       on_changed: null,
//                       editingController: controller.email_controller,
//                       input_type: TextInputType.emailAddress,
//                       label: 'Enter Your E-Mail',
//                       maxlines: 1,
//                       suffix_icon: const Icon(Icons.email),
//                       obscure_text: false,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextButton(
//                       onPressed: () {
//                         controller.postdata(context);
//                       },
//                       style: TextButton.styleFrom(
//                           foregroundColor: BLUE_DARK_COLOR,
//                           backgroundColor: YELLOW_COLOR),
//                       child: const Text('Send Verification Code')),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const login_view_page(),
//                         ));
//                       },
//                       style: TextButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
//                       child: const Text('BACK TO LOGIN PAGE')),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
