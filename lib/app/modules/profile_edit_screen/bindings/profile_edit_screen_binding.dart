import 'package:get/get.dart';

import '../controllers/profile_edit_screen_controller.dart';

class ProfileEditScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditScreenController>(
      () => ProfileEditScreenController(),
    );
  }
}
