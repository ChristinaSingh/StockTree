import 'package:get/get.dart';

import '../controllers/forgote_pass_screen_controller.dart';

class ForgotePassScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotePassScreenController>(
      () => ForgotePassScreenController(),
    );
  }
}
