import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingScreenController extends GetxController {


  final count = 0.obs;

  final PageController pageController = PageController();
  int currentPage = 0;
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
}
