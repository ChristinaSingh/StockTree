import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class KycOtpVerfyController extends GetxController {
  TextEditingController pin = TextEditingController();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void onClickVerify() {
    Get.toNamed(Routes.SUCCESS_SCREEN_KYC);
  }

  void onClickSendAgain() {}
}
