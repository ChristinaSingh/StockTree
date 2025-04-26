import 'package:get/get.dart';

class SupportNotificationController extends GetxController {
  List<Map<String, dynamic>> settingList = [
    {'name': 'General Notification', "on_off": false},
    {
      'name': 'Sound',
      "on_off": false,
    },
    {
      'name': 'Vibrate',
      "on_off": false,
    },
    {'name': 'App Updates', "on_off": false},
    {'name': 'New Tips Available', "on_off": false},
  ];

  final count = 0.obs;
  final isNotification = false.obs;

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

  void clickOnItem(int index) {
    switch (index) {
      case 0:
        {}
        break;
      case 1:
        {
          // Get.toNamed(Routes.SUPPORT);
        }
        break;
      case 2:
        {
          //Get.toNamed(Routes.ABOUT_US);
        }
        break;
      case 3:
        {
          //Get.toNamed(Routes.PRIVACY_POLICY);
        }
        break;
      case 4:
        {
          // CommonWidgets.showAlertDialog(onPressedYes: () {
          //   logout();
          // });
        }
        break;
    }
  }
}
