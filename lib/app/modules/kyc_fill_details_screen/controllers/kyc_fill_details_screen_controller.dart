import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stocktree/app/routes/app_pages.dart';

import '../../../common/image_pick_and_crop.dart';

class KycFillDetailsScreenController extends GetxController {
  // Available ID types
  final types = <String>[
    'Drivers Licence',
    'Passport',
    'National ID',
  ];

  /// Pick expiry date via date picker
  Future<void> pickExpiryDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: DateTime(now.year + 20),
    );
    if (picked != null) expiryDate.value = picked;
  }

  // Selected values
  final selectedType = RxString('Drivers Licence');
  final idNumber = ''.obs;
  final expiryDate = Rxn<DateTime>();
  final filePath = RxnString();
  final selectImage = Rxn<File>();
  final profileImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIn-gE6j6sjvg0ekFgFBIzVP5VdN3aBu9dLg&s'
          .obs;





  final count = 0.obs;


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

  void clickOnUpload({required BuildContext context}) {

  }

  void clickOnSubmitButton() {
    Get.toNamed(Routes.KYC_OTP_VERFY);

  }
}
