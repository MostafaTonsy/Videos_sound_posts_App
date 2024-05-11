// import "package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/forgot_password/F_p_email_v.dart";
// import "package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/registration&full_info.dart.dart";
// import "package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_controllers/login_controller.dart";
// import "package:advanced_e_commerce_app/FEATURES/handling_DAta_view.dart/handlind_data_view.dart";
// import "package:advanced_e_commerce_app/core/constants/Colors.dart";
// import "package:advanced_e_commerce_app/core/functions/validator_function.dart";
// import "package:advanced_e_commerce_app/core/utils/custom_text_field.dart";
// import "package:advanced_e_commerce_app/core/utils/size_config.dart";
// import "package:flutter/material.dart";
// import "package:flutter_riverpod/flutter_riverpod.dart";
// import "package:get/get.dart";

// class login_view_page extends ConsumerStatefulWidget {
//   const login_view_page({super.key});

//   @override
//   ConsumerState<login_view_page> createState() => _login_view_page_state();
// }

// class _login_view_page_state extends ConsumerState<login_view_page> {
//   GlobalKey<FormState> form_key = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     Login_Controller loginController = Get.put(Login_Controller());

//     return Scaffold(
//       backgroundColor: purple_dark,
//       body: GetBuilder<Login_Controller>(
//         builder: (controller) => handling_request_view(
//           status_request: controller.statusRequest,
//           widget: SafeArea(
//             child: Center(
//               child: Container(
//                 width: size_config.screen_width! * 0.88,
//                 margin: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Form(
//                   canPop: false,
//                   key: form_key,
//                   child: ListView(
//                     children: [
//                       const SizedBox(
//                         height: 25,
//                       ),
//                       const Center(
//                         child: Text(
//                           'LOGIN',
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       const Center(
//                         child: CircleAvatar(
//                           radius: 120,
//                           backgroundImage: AssetImage('assets/login2.jpg'),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(12),
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(15)),
//                         ),
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               height: size_config.default_size! * 5,
//                               child: CUSTOM_TEXT_FORM_FIELD(
//                                 VALIDATOR: (value) {
//                                   if (!GetUtils.isEmail(value!)) {
//                                     return "Invalid Email";
//                                   } else {
//                                     return validinput(value, 3, 35);
//                                   }
//                                 },
//                                 on_changed: null,
//                                 input_type: TextInputType.emailAddress,
//                                 label: 'Enter your Email',
//                                 suffix_icon: const Icon(Icons.email),
//                                 maxlines: 1,
//                                 editingController: controller.email_controller,
//                                 obscure_text: false,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             SizedBox(
//                               height: size_config.default_size! * 5,
//                               child: CUSTOM_TEXT_FORM_FIELD(
//                                   VALIDATOR: (value) {
//                                     return validinput(value!, 3, 35);
//                                   },
//                                   on_changed: null,
//                                   input_type: TextInputType.text,
//                                   label: 'Enter Your Password',
//                                   suffix_icon: const Icon(Icons.key),
//                                   maxlines: 1,
//                                   editingController:
//                                       controller.password_controller,
//                                   obscure_text: true),
//                             ),
//                             const SizedBox(
//                               height: 30,
//                             ),
//                             TextButton(
//                                 onPressed: () {
//                                   if (form_key.currentState!.validate()) {
//                                     controller.postdata(context);
//                                   }
//                                 },
//                                 style: TextButton.styleFrom(
//                                     foregroundColor: BLUE_DARK_COLOR,
//                                     backgroundColor: Colors.yellow),
//                                 child: const Text('LOGIN')),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Get.to(() => const Registration_Full_Info(),
//                                     transition: Transition.upToDown);
//                               },
//                               style: TextButton.styleFrom(
//                                   foregroundColor: Colors.white,
//                                   backgroundColor: Colors.black),
//                               child: const Text(
//                                 'Not Registered? Register Here!',
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) =>
//                                       const FORGOT_PASSWROD_VIEW(),
//                                 ));
//                               },
//                               style: TextButton.styleFrom(
//                                   foregroundColor: Colors.white,
//                                   backgroundColor: Colors.black),
//                               child: const Text(
//                                 'Forgot Password? Press Here',
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: TextButton(
//                                   onPressed: () async {
//                                     await controller.login_with_google(context);
//                                   },
//                                   style: TextButton.styleFrom(
//                                       foregroundColor: Colors.white,
//                                       backgroundColor:
//                                           const Color.fromARGB(255, 12, 0, 124),
//                                       minimumSize:
//                                           const Size(double.infinity, 50)),
//                                   child: const Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       CircleAvatar(
//                                         radius: 10,
//                                         backgroundImage: AssetImage(
//                                             'assets/google_logo.png'),
//                                       ),
//                                       SizedBox(
//                                         width: 6,
//                                       ),
//                                       Text('Google'),
//                                     ],
//                                   )),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
