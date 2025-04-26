import 'package:get/get.dart';

import '../controllers/success_screen_member_ship_controller.dart';

class SuccessScreenMemberShipBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessScreenMemberShipController>(
      () => SuccessScreenMemberShipController(),
    );
  }
}
