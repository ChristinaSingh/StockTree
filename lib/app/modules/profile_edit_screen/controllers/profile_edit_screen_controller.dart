import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stocktree/app/common/colors.dart';

import '../../../common/image_pick_and_crop.dart';

class ProfileEditScreenController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodeNickName = FocusNode();
  FocusNode focusNodeDate = FocusNode();
  final isPassword = false.obs;
  final isEmail = false.obs;
  final isName = false.obs;
  final isNickName = false.obs;
  final isDate = false.obs;
  final isHide = true.obs;
  final isCheck = false.obs;
  final count = 0.obs;
  final tabIndex = 0.obs;
  final showLoading = false.obs;
  String? deviceToken;
  int selectedIndex = 0;
  final countryDailCode = '+91'.obs;
  final selectImage = Rxn<File>();
  final isLoading = false.obs;
//  GetProfileResponse? getProfileResponse;
  final profileImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIn-gE6j6sjvg0ekFgFBIzVP5VdN3aBu9dLg&s'
          .obs;


  void startListener() {
    focusNodeEmail.addListener(onFocusChange);
    focusNodePassword.addListener(onFocusChange);
    focusNodeName.addListener(onFocusChange);
    focusNodeNickName.addListener(onFocusChange);
    focusNodeDate.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusNodeEmail.hasFocus;
    isPassword.value = focusNodePassword.hasFocus;
    isName.value = focusNodeName.hasFocus;
    isNickName.value = focusNodeNickName.hasFocus;
    isDate.value = focusNodeDate.hasFocus;
  }

  final List<String> timeOffTypes = [
    'Gender',
    'Free trial',
    'Paid subscription',
  ];

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



  clickOnCountryCode({required CountryCode value}) {
    countryDailCode.value = value.dialCode.toString();
  }



  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      initialDate: DateTime(2000),
      // Set a more reasonable default date
      firstDate: DateTime(1940),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor, // Header background color
            hintColor: primaryColor, // Selected date circle color
            colorScheme: ColorScheme.light(
              primary: primaryColor, // Selection color
              onPrimary: Colors.white, // Text color on selected date
              onSurface: Colors.black, // Default text color
            ),
            dialogBackgroundColor:
            Colors.white, // Background color of the picker
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      print("Selected date: $formattedDate");
      dateController.text = formattedDate;
    }
  }


  onSelectedItemChanged({required int index}) {
    selectedIndex = index;
    increment();
  }

  @override
  void onInit() {
    super.onInit();
    startListener();
    //requestNotificationPermission();
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
