import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:videos_sounds_app/FEATURES/FIREBASE_MESSAGING/VIEWS/NOTIFICATION_DETAILS_SCREEN.dart';

class Firebase_Messaging {
  final firebasemessaging = FirebaseMessaging.instance;

  Future<void> init_notifications() async {
    await firebasemessaging.requestPermission();
    String? token = await firebasemessaging.getToken();
    print(token);
  }

  static void handle_message(RemoteMessage? remoteMessage) {
    if (remoteMessage == null) {
      return;
    } else {
      Get.to(() => NOTIFICATIONS_SCREEN(message: remoteMessage),
          transition: Transition.rightToLeft);
    }
  }

  static Future handle_background_notification() async {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      handle_message(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handle_message(message);
    });
  }

  static fcmconfig() {
    FirebaseMessaging.onMessage.listen((message) {
      //    FlutterRingtonePlayer().playNotification();
      Get.snackbar(message.notification!.title!, message.notification!.body!);
    });
  }
}
