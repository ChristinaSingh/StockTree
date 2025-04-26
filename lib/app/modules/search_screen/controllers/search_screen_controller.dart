import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  final count = 0.obs;
  TextEditingController nameController = TextEditingController();
  FocusNode focusNodeName = FocusNode();
  final isName = false.obs;

  RxList<String> drafts = [
    'Love Story of a SPy',
    'Dragon Ball Daima',
    'Horror Express',
    'This is Not Now'
  ].obs;


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
