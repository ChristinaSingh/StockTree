import 'dart:io';

import 'package:get/get.dart';

import 'package:stocktree/app/modules/profile_screen/views/profile_screen_view.dart';
import 'package:stocktree/app/modules/research_screen/views/research_screen_view.dart';
import 'package:stocktree/app/modules/search_screen/views/search_screen_view.dart';
import 'package:stocktree/app/modules/trades_screen/views/trades_screen_view.dart';

import '../../../common/common_widgets.dart';
import '../../home/views/home_view.dart';

final selectedIndex = 0.obs;

class NavBarController extends GetxController {
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

  body() {
    switch (selectedIndex.value) {
      case 0:
        return const SearchScreenView();
      case 1:
        return const TradesScreenView();
      case 2:
        return const HomeView();
      case 3:
        return const ResearchScreenView();
      case 4:
        return const ProfileScreenView();
    }
  }

  onClickBack() {
    CommonWidgets.showAlertDialog(
      title: "Exit App",
      content: "Do you want to Exit from App",
      onPressedYes: () async {
        if (Platform.isAndroid) {
          Get.back(); // Close dialog
          Future.delayed(const Duration(milliseconds: 300), () {
            exit(0); // Exit app for Android
          });
        } else if (Platform.isIOS) {
          Get.back(); // Close dialog
          Future.delayed(const Duration(milliseconds: 300), () {
            exit(0); // Exit app for iOS
          });
        }
      },
    );
  }
}
