import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:test_app/controller/orders/pending_controller.dart';
import 'package:get/get.dart';

requestpermissionNotification() async {
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

fcmconfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("=============notification=============");
    print(message.notification!.title);
    print(message.notification!.body);
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print("========================== page id");
  print(data['pageid']);
  print("========================== page name");
  print(data['pagename']);
  print("========================== Current Route");
  print(Get.currentRoute);

  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
    OrdersPendingController controller = Get.find();
    controller.refreshorder();
  }
}
