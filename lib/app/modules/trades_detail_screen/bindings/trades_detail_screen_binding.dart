import 'package:get/get.dart';

import '../controllers/trades_detail_screen_controller.dart';

class TradesDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TradesDetailScreenController>(
      () => TradesDetailScreenController(),
    );
  }
}
