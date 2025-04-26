import 'package:get/get.dart';

class TradesDetailScreenController extends GetxController {
  var isProfitTab = true.obs;
  var selectedTimeframe = 'Day'.obs;
  var buyPercentage = 90.obs;
  var sellPercentage = 10.obs;

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
