import 'package:get/get.dart';

import '../controllers/support_notification_controller.dart';

class SupportNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportNotificationController>(
      () => SupportNotificationController(),
    );
  }
}
