import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:videos_sounds_app/FEATURES/FIREBASE_MESSAGING/CONTROLLER/FIREBASE_MESSAGING_CONTROLLER.dart';
import 'package:videos_sounds_app/FEATURES/SPLASH/VIEWS/SPLASH_VIEW.dart';
import 'package:videos_sounds_app/core/crud/crud.dart';
import 'package:videos_sounds_app/core/utils/size_config.dart';
import 'package:videos_sounds_app/firebase_options.dart';

late SharedPreferences shared_p;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shared_p = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase_Messaging().init_notifications();
  await Firebase_Messaging.handle_background_notification();
  await Firebase_Messaging.fcmconfig();
  String? token = await FirebaseMessaging.instance.getToken();
  print(token);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    size_config().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialBinding: BindingsBuilder.put(() => CRUD()),
      home: const SPLASH_VIEW(),
    );
  }
}
