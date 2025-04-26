import 'package:get/get.dart';

import '../controllers/kyc_fill_details_screen_controller.dart';

class KycFillDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KycFillDetailsScreenController>(
      () => KycFillDetailsScreenController(),
    );
  }
}
