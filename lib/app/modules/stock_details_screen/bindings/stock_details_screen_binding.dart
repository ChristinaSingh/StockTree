import 'package:get/get.dart';

import '../controllers/stock_details_screen_controller.dart';

class StockDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockDetailsScreenController>(
      () => StockDetailsScreenController(),
    );
  }
}
