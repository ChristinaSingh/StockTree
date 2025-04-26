import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final count = 0.obs;

  // var animate = false.obs;

  var isLoading = false.obs;

  void showLoader() => isLoading.value = true;

  void hideLoader() => isLoading.value = false;

  @override
  void onInit() {
    super.onInit();
    // Future.delayed(const Duration(milliseconds: 500), () {
    //   animate.value = true;
    // });

    manageSession();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void manageSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 3));
    print("USER ID:::::::::::${prefs.getString(ApiKeyConstants.userId)}");
    print("userToken:::::::::::${prefs.getString(ApiKeyConstants.token)}");
    if (prefs.getString(ApiKeyConstants.userId) != null) {
      isLoading.value = true;
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.toNamed(Routes.HOME);
      });
    } else {
      isLoading.value = true;
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.toNamed(Routes.ONBOARDING_SCREEN);
      });
    }
  }

  void increment() => count.value++;
}
