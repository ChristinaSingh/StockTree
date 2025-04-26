import 'package:get/get.dart';

class AboutScreenController extends GetxController {
  final inAsyncCall = true.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 500), () {
      inAsyncCall.value = false;
    });
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
}
