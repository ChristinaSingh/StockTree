import 'package:get/get.dart';

import '../controllers/kyc_otp_verfy_controller.dart';

class KycOtpVerfyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KycOtpVerfyController>(
      () => KycOtpVerfyController(),
    );
  }
}
