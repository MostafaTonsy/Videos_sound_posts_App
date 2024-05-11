// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/login_view_page.dart';
// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_controllers/verify_code_controller.dart';
// import 'package:advanced_e_commerce_app/FEATURES/handling_DAta_view.dart/handlind_data_view.dart';
// import 'package:advanced_e_commerce_app/core/constants/Colors.dart';
// import 'package:advanced_e_commerce_app/core/utils/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';

// class otp_verification_screen extends StatefulWidget {
//   final String email;
//   const otp_verification_screen({super.key, required this.email});

//   @override
//   State<otp_verification_screen> createState() => _otp_verification_screen();
// }

// class _otp_verification_screen extends State<otp_verification_screen> {
//   GlobalKey<FormState> form_key = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     Get.put(verify_code_sign_up_controller());
//     return Scaffold(
//       backgroundColor: purple_dark,
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: purple_dark,
//         foregroundColor: Colors.yellow,
//         title: const Text(
//           'VERIFY OTP ',
//           style: TextStyle(color: Colors.white, fontSize: 17),
//         ),
//       ),
//       body: GetBuilder<verify_code_sign_up_controller>(
//         builder: (controller) => handling_request_view(
//           status_request: controller.statusRequest,
//           widget: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 15),
//             padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
//             child: Form(
//               key: form_key,
//               child: Container(
//                 height: size_config.screen_height! * 0.75,
//                 decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.all(Radius.circular(15))),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     OtpTextField(
//                       clearText: false,
//                       styles: const [
//                         TextStyle(color: Colors.black),
//                         TextStyle(color: Colors.black),
//                         TextStyle(color: Colors.black),
//                         TextStyle(color: Colors.black),
//                         TextStyle(color: Colors.black)
//                       ],
//                       numberOfFields: 5,
//                       borderRadius: BorderRadius.circular(8),
//                       fieldHeight: 40,
//                       fieldWidth: 28,
//                       focusedBorderColor: Colors.blue,
//                       enabledBorderColor: Colors.yellow,
//                       borderColor: const Color(0xFF512DA8),
//                       //set to true to show as box or false to show as dash
//                       showFieldAsBox: true,
//                       //runs when a code is typed in
//                       onCodeChanged: (String code) {
//                         //handle validation or checks here
//                       },
//                       //runs when every textfield is filled
//                       onSubmit: (String verificationCode) {
//                         if (form_key.currentState!.validate()) {
//                           controller.go_to_main_page(
//                               email: widget.email,
//                               context: context,
//                               verification_code: verificationCode);
//                         }
//                       }, // end onSubmit
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     TextButton(
//                         onPressed: () {
//                           Get.to(() => const login_view_page(),
//                               transition: Transition.circularReveal);
//                         },
//                         style: TextButton.styleFrom(
//                             foregroundColor: Colors.white,
//                             backgroundColor:
//                                 const Color.fromARGB(255, 0, 0, 0)),
//                         child: const Text('BACK TO LOGIN PAGE')),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
