import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class KycScreenController extends GetxController
    with GetTickerProviderStateMixin {
  late final AnimationController emojiController;
  late final Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    emojiController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    )..repeat(reverse: true);
    scaleAnimation = Tween<double>(begin: 1.0, end: 1.2)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(emojiController);
  }

  @override
  void onClose() {
    emojiController.dispose();
    super.onClose();
  }
}
