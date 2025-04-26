import 'package:get/get.dart';

import '../controllers/success_screen_kyc_controller.dart';

class SuccessScreenKycBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessScreenKycController>(
      () => SuccessScreenKycController(),
    );
  }
}
