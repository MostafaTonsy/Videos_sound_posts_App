// import "package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/forgot_password/F_p_email_v.dart";
// import "package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/registration&full_info.dart.dart";
// import "package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_controllers/forgot_password/f_p_reset_password.dart";
// import "package:advanced_e_commerce_app/FEATURES/MAIN_MARKET_PRODUCTS_PAGE.dart/views-WIDGETS/VIEWS/Main_market_products_page.dart";
// import "package:advanced_e_commerce_app/FEATURES/handling_DAta_view.dart/handlind_data_view.dart";
// import "package:advanced_e_commerce_app/core/constants/Colors.dart";
// import "package:advanced_e_commerce_app/core/functions/validator_function.dart";
// import "package:advanced_e_commerce_app/core/utils/custom_text_field.dart";
// import "package:advanced_e_commerce_app/core/utils/size_config.dart";
// import "package:flutter/material.dart";
// import "package:get/get.dart";

// class F_P_reset_password_screen extends StatefulWidget {
//   const F_P_reset_password_screen({super.key});

//   @override
//   State<F_P_reset_password_screen> createState() =>
//       _F_P_reset_password_screenSTATE();
// }

// class _F_P_reset_password_screenSTATE extends State<F_P_reset_password_screen> {
//   GlobalKey<FormState> form_key = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     Get.put(f_p_reset_password_controller());
//     return Scaffold(
//       backgroundColor: purple_dark,
//       appBar: AppBar(
//         backgroundColor: purple_dark,
//         foregroundColor: Colors.yellow,
//         centerTitle: true,
//         title: const Text(
//           'Enter New Password ',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: GetBuilder<f_p_reset_password_controller>(
//         builder: (controller) => handling_request_view(
//           status_request: controller.statusRequest,
//           widget: Center(
//             child: Container(
//               width: size_config.screen_width! * 0.88,
//               margin: const EdgeInsets.symmetric(horizontal: 15),
//               child: Form(
//                 canPop: false,
//                 key: form_key,
//                 child: Column(
//                   children: [
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     SizedBox(
//                       height: size_config.default_size! * 5,
//                       child: CUSTOM_TEXT_FORM_FIELD(
//                         VALIDATOR: (value) {
//                           if (!GetUtils.isEmail(value!)) {
//                             return "Invalid Email";
//                           } else {
//                             return validinput(value, 3, 50);
//                           }
//                         },
//                         on_changed: null,
//                         input_type: TextInputType.emailAddress,
//                         label: 'Enter your Email',
//                         suffix_icon: const Icon(Icons.email),
//                         maxlines: 1,
//                         editingController: controller.email_controller,
//                         obscure_text: false,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(
//                       height: size_config.default_size! * 5,
//                       child: CUSTOM_TEXT_FORM_FIELD(
//                           VALIDATOR: (value) {
//                             return validinput(value!, 3, 35);
//                           },
//                           on_changed: null,
//                           input_type: TextInputType.text,
//                           label: 'Enter Your Password',
//                           suffix_icon: const Icon(Icons.key),
//                           maxlines: 1,
//                           editingController: controller.password_controller,
//                           obscure_text: true),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     SizedBox(
//                       height: size_config.default_size! * 5,
//                       child: CUSTOM_TEXT_FORM_FIELD(
//                           VALIDATOR: (value) {
//                             return validinput(value!, 3, 20);
//                           },
//                           on_changed: null,
//                           input_type: TextInputType.text,
//                           label: 'Enter Your Password Again',
//                           suffix_icon: const Icon(Icons.key),
//                           maxlines: 1,
//                           editingController: controller.re_password_controller,
//                           obscure_text: true),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     TextButton(
//                         onPressed: () async {
//                           if (form_key.currentState!.validate()) {
//                             controller.postdata(context);
//                           }
//                         },
//                         style: TextButton.styleFrom(
//                             foregroundColor: BLUE_DARK_COLOR,
//                             backgroundColor: Colors.yellow),
//                         child: const Text('Save & Continue')),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Get.to(() => const Registration_Full_Info(),
//                             transition: Transition.upToDown);
//                       },
//                       style: TextButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           backgroundColor: Colors.black),
//                       child: const Text(
//                         'Not Registered? Register Here!',
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => const FORGOT_PASSWROD_VIEW(),
//                         ));
//                       },
//                       style: TextButton.styleFrom(
//                           foregroundColor: Colors.white,
//                           backgroundColor: Colors.black),
//                       child: const Text(
//                         'Forgot Password? Press Here',
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: TextButton(
//                           onPressed: () async {
//                             Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) =>
//                                   const main_market_products_page(),
//                             ));
//                           },
//                           style: TextButton.styleFrom(
//                               foregroundColor: Colors.white,
//                               backgroundColor:
//                                   const Color.fromARGB(255, 12, 0, 124),
//                               minimumSize: const Size(double.infinity, 50)),
//                           child: const Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.g_mobiledata_rounded,
//                                 color: Colors.white,
//                               ),
//                               Text('Google'),
//                             ],
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         //
//       ),
//     );
//   }
// }
