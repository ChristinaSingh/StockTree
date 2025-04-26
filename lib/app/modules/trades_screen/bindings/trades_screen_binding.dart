import 'package:get/get.dart';

import '../controllers/trades_screen_controller.dart';

class TradesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradesScreenController>(
      () => TradesScreenController(),
    );
  }
}
