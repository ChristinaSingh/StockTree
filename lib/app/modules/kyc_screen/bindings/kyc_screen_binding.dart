import 'package:get/get.dart';

import '../controllers/kyc_screen_controller.dart';

class KycScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KycScreenController>(
      () => KycScreenController(),
    );
  }
}
