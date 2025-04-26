import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResearchDetailScreenController extends GetxController {
  String userId = '';
  bool inAsyncCall = false;
  List<String> gallery = [
    "https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png",
    "https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png",
    "https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png",
    "https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png",
    "https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png",

  ];





  clickRequestEstimateButton({required BuildContext context}) async {

  }

  clickMessageButton({required BuildContext context}) async {

  }

  clickOnBackButton({required BuildContext context}) {
  Get.back();
  }

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
}
