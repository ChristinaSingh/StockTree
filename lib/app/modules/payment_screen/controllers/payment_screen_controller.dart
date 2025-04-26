import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stocktree/app/routes/app_pages.dart';

class PaymentScreenController extends GetxController {
  final showLoading = false.obs;
  List items = [
    'Rewards Payment',
    'payment milestones',
    'Google Pay',
    'Apple Pay',
    'Visa/Master/AMEX'
  ];

  List<Map<String, dynamic>> methodeList = [
    {'name': 'Rewards Payment', "on_off": 0},
    {
      'name': 'payment milestones',
      "on_off": 1,
    },
    {
      'name': 'Google Pay',
      "on_off": 2,
    },
    {'name': 'Apple Pay', "on_off": 3},
    {'name': 'Visa/Master/AMEX', "on_off": 4},
  ];

  final selectedMethodId = 0.obs;

  clickOnItem(
      {required BuildContext context, required int index, required value1}) {
    selectedMethodId.value = index;
    print(value1);
    print(selectedMethodId);
    increment();
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

  void clickOnSubmitButton() {
    Get.toNamed(Routes.SUCCESS_SCREEN_MEMBER_SHIP);
  }
}
