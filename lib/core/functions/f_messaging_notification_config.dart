/*import 'package:advanced_e_commerce_app/FEATURES/ORDER_PAGE/order_controller/order_cont.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPERMISSION() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

firebase_messaging_config() {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(
        remoteMessage.notification!.title!, remoteMessage.notification!.body!);

    refresh_page_on_receiving_notification(remoteMessage.data);
  });
}

refresh_page_on_receiving_notification(data) {
  if (Get.currentRoute == "order_page" &&
      data['pagename'] == "order_page_resfresh") {
    order_controller controller = Get.find();
    controller.Refresh_page();
  }
}
*/