import 'package:get/get.dart';

import '../controllers/research_screen_controller.dart';

class ResearchScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResearchScreenController>(
      () => ResearchScreenController(),
    );
  }
}
