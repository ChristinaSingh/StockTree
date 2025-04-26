import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/common_widgets.dart';
import '../../../common/image_pick_and_crop.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class ProfileScreenController extends GetxController {
  List<Map<String, String>> settingList = [
    {'name': StringConstants.profile, 'image': IconConstants.icProfileSvg},
    {
      'name': StringConstants.membership,
      'image': IconConstants.icMemberShipSvg
    },
    {
      'name': StringConstants.kYC,
      'image': IconConstants.icMemberShipSvg
    },
    {'name': StringConstants.notifications, 'image': IconConstants.icNotificationProfile},
    {'name': StringConstants.support, 'image': IconConstants.icSupportSvg},
    {'name': StringConstants.aboutUs, 'image': IconConstants.icAboutSvg},
    {'name': StringConstants.logout, 'image': IconConstants.icLogOutSvg},
  ];

  final showLoading = false.obs;
  final selectImage = Rxn<File>();
  final isLoading = false.obs;
//  GetProfileResponse? getProfileResponse;
  final profileImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIn-gE6j6sjvg0ekFgFBIzVP5VdN3aBu9dLg&s'
          .obs;
  final count = 0.obs;
  final fullName = 'Amit kumar'.obs;
  final emailName = 'Amitkumar@gmail.com'.obs;
  final isNotification = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProfileApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getProfileApi() async {


  }

  void increment() => count.value++;

  void clickOnItem(int index) {
    switch (index) {
      case 0:
        {
          Get.toNamed(Routes.PROFILE_EDIT_SCREEN);
        }
        break;
      case 1:
        {
            Get.toNamed(Routes.MEMBER_SHIP_SCREEN);
        }
        break;
      case 2:
        {
          Get.toNamed(Routes.KYC_SCREEN);
        }
        break;
      case 3:
        {
          Get.toNamed(Routes.SUPPORT_NOTIFICATION);
        }
        break;
      case 4:
        {
          Get.toNamed(Routes.SUPPORT_SCREEN);
        }
        break;
      case 5:
        {
          Get.toNamed(Routes.ABOUT_SCREEN);
        }
        break;
      case 6:
        {
          CommonWidgets.showAlertDialog(onPressedYes: () {
            logout();
          });
        }
        break;
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_id'); // Remove user user_id
    await prefs.remove('token'); // Remove user token
    Get.offNamed(Routes.SIGN_IN_SCREEN);
    print("User logged out successfully.");
  }

  Future<void> pickImages() async {
    selectImage.value = await ImagePickerAndCropper.pickImage(
      context: Get.context!,
      pickImageFromGallery: true,
      wantCropper: true,
      color: Theme.of(Get.context!).primaryColor,
    );
    print("selected ${selectImage.value}");
    increment();
  }
}
