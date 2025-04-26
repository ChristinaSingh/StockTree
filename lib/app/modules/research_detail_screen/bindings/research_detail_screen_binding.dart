import 'package:get/get.dart';

import '../controllers/research_detail_screen_controller.dart';

class ResearchDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResearchDetailScreenController>(
      () => ResearchDetailScreenController(),
    );
  }
}
