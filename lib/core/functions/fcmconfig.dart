import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../controller/orders/pending_controller.dart';

requestPermissionNotification() async {
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
  FirebaseMessaging.onMessage.listen(
    (message) {
      print("=============Notification==============");
      print(message.notification!.title);
      print(message.notification!.body);
      Get.snackbar(message.notification!.title!, message.notification!.body!);
      refreshPageNotification(message.data);
    },
  );
}

refreshPageNotification(data) {
  print("=============Pageid=====================");
  print(data['pageid']);
  print("=============Pagename=====================");
  print(data['pagename']);

  print("==================Current Root===============");
  print(Get.currentRoute);

  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
    OrdersPendingController controller = Get.find();
    controller.refreshOrder();
  }
}
