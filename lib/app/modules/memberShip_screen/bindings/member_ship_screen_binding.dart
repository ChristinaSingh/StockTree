import 'package:get/get.dart';

import '../controllers/member_ship_screen_controller.dart';

class MemberShipScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MemberShipScreenController>(
      () => MemberShipScreenController(),
    );
  }
}
