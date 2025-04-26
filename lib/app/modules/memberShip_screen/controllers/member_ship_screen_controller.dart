import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum Plan { annual, monthly }


class MemberShipScreenController extends GetxController with GetTickerProviderStateMixin {
  final selectedPlan = Plan.annual.obs;

  void selectPlan(Plan plan) {
    selectedPlan.value = plan;
  }

  final count = 0.obs;

  late final AnimationController shakeController;
  late final Animation<double> shakeAnimation;

  @override
  void onInit() {
    super.onInit();
    shakeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    shakeAnimation = Tween<double>(begin: -5.0, end: 5.0)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(shakeController);

    shakeController.repeat(reverse: true);
  }

  @override
  void dispose() {
    shakeController.dispose();
    super.dispose();
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
