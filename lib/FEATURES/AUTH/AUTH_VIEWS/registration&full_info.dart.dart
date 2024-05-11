// import 'dart:io';

// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_VIEWS/login_view_page.dart';
// import 'package:advanced_e_commerce_app/FEATURES/AUTH/AUTH_controllers/signup_controller.dart';
// import 'package:advanced_e_commerce_app/FEATURES/handling_DAta_view.dart/handlind_data_view.dart';
// import 'package:advanced_e_commerce_app/core/constants/Colors.dart';
// import 'package:advanced_e_commerce_app/core/functions/validator_function.dart';
// import 'package:advanced_e_commerce_app/core/utils/custom_text_field.dart';
// import 'package:advanced_e_commerce_app/core/utils/show_snackbar.dart';
// import 'package:advanced_e_commerce_app/core/utils/size_config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// class Registration_Full_Info extends ConsumerStatefulWidget {
//   const Registration_Full_Info({super.key});

//   @override
//   ConsumerState<Registration_Full_Info> createState() => _complete_info_PAGE();
// }

// class _complete_info_PAGE extends ConsumerState<Registration_Full_Info> {
//   GlobalKey<FormState> form_key = GlobalKey<FormState>();

//   File? image;

//   void SELECT_IMAGE(BuildContext context) async {
//     final imagepath =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (imagepath != null) {
//       image = File(imagepath.path);
//     }

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     Signup_controller signupController = Get.put(Signup_controller());

//     return Scaffold(
//       backgroundColor: purple_dark,
//       appBar: AppBar(
//         backgroundColor: purple_dark,
//         foregroundColor: Colors.yellow,
//         title: const Text(
//           'Register',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: GetBuilder<Signup_controller>(
//         builder: (controller) => handling_request_view(
//           status_request: controller.statusRequest,
//           widget: Center(
//             child: SizedBox(
//               width: size_config.screen_width! * 0.88,
//               child: Form(
//                 canPop: false,
//                 key: form_key,
//                 child: ListView(
//                   children: [
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     (image == null)
//                         ? CircleAvatar(
//                             backgroundImage:
//                                 const AssetImage('assets/user_logo.png'),
//                             radius: 60,
//                             child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child: IconButton(
//                                 onPressed: () {
//                                   SELECT_IMAGE(context);
//                                 },
//                                 icon: const Icon(
//                                   Icons.add_a_photo,
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                 ),
//                               ),
//                             ),
//                           )
//                         : CircleAvatar(
//                             backgroundImage: FileImage(image!),
//                             radius: 60,
//                             child: Align(
//                               alignment: Alignment.bottomCenter,
//                               child: IconButton(
//                                 onPressed: () {
//                                   SELECT_IMAGE(context);
//                                 },
//                                 icon: const Icon(
//                                   Icons.add_a_photo,
//                                   color: Color.fromARGB(255, 0, 0, 0),
//                                 ),
//                               ),
//                             ),
//                           ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(15),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15)),
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: size_config.default_size! * 4.5,
//                             child: CUSTOM_TEXT_FORM_FIELD(
//                               VALIDATOR: (value) {
//                                 if (!GetUtils.isEmail(value!)) {
//                                   return "Invalid Email";
//                                 } else {
//                                   return validinput(value, 3, 40);
//                                 }
//                               },
//                               editingController: controller.email_controller,
//                               input_type: TextInputType.emailAddress,
//                               label: 'Enter Your Email',
//                               maxlines: 1,
//                               obscure_text: false,
//                               on_changed: null,
//                               suffix_icon: const Icon(Icons.email),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           SizedBox(
//                             height: size_config.default_size! * 4.5,
//                             child: CUSTOM_TEXT_FORM_FIELD(
//                               VALIDATOR: (value) {
//                                 return validinput(value!, 3, 40);
//                               },
//                               editingController: controller.password_controller,
//                               input_type: TextInputType.number,
//                               label: 'Enter Your Password',
//                               maxlines: 1,
//                               obscure_text: true,
//                               on_changed: null,
//                               suffix_icon: const Icon(Icons.key),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           SizedBox(
//                             height: size_config.default_size! * 4.5,
//                             child: CUSTOM_TEXT_FORM_FIELD(
//                               VALIDATOR: (value) {
//                                 return validinput(value!, 3, 41);
//                               },
//                               editingController: controller.name_controller,
//                               input_type: TextInputType.text,
//                               label: 'Enter Your Name',
//                               maxlines: 1,
//                               obscure_text: false,
//                               on_changed: null,
//                               suffix_icon: const Icon(Icons.person),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           SizedBox(
//                             height: size_config.default_size! * 4.5,
//                             child: CUSTOM_TEXT_FORM_FIELD(
//                               VALIDATOR: (value) {
//                                 if (!GetUtils.isPhoneNumber(value!)) {
//                                   return "Invalid Phone Number";
//                                 } else {
//                                   return validinput(value, 3, 50);
//                                 }
//                               },
//                               editingController:
//                                   controller.phonenumber_controller,
//                               input_type: TextInputType.text,
//                               label: 'Enter Your Phone Number',
//                               maxlines: 1,
//                               obscure_text: false,
//                               on_changed: null,
//                               suffix_icon: const Icon(Icons.phone),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           SizedBox(
//                             height: size_config.default_size! * 8,
//                             child: CUSTOM_TEXT_FORM_FIELD(
//                               VALIDATOR: (value) {
//                                 return validinput(value!, 3, 50);
//                               },
//                               editingController: controller.address_controller,
//                               input_type: TextInputType.multiline,
//                               label: 'Enter Your Address',
//                               maxlines: 2,
//                               obscure_text: false,
//                               on_changed: null,
//                               suffix_icon: const Icon(Icons.home_outlined),
//                             ),
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextButton(
//                               onPressed: () async {
//                                 if (form_key.currentState!.validate()) {
//                                   if (image != null) {
//                                     await controller.postdata(
//                                         context: context, file: image!);
//                                   } else {
//                                     ShowSnackbar(
//                                         ERROR:
//                                             'You Should Pick a Photo from Gallery',
//                                         context: context);
//                                   }
//                                 }
//                               },
//                               style: TextButton.styleFrom(
//                                   foregroundColor: BLUE_DARK_COLOR,
//                                   backgroundColor: Colors.yellow),
//                               child: const Text('Register')),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Get.to(() => const login_view_page(),
//                                   transition: Transition.leftToRight);
//                             },
//                             style: TextButton.styleFrom(
//                                 backgroundColor: Colors.black,
//                                 foregroundColor: Colors.white),
//                             child: const Text(
//                               'Already registered? Login Here!',
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
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
