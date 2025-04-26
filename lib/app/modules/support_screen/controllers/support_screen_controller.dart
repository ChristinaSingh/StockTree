import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';

class SupportScreenController extends GetxController {
  final count = 0.obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusMobile = FocusNode();
  FocusNode focusMessage = FocusNode();
  final isMobile = false.obs;
  final isFullName = false.obs;
  final isEmail = false.obs;
  final isMessage = false.obs;
  final showLoading = false.obs;


  @override
  void onInit() {
    super.onInit();
    startListener();
  }
  void startListener() {
    focusNodeName.addListener(onFocusChange);
    focusNodeEmail.addListener(onFocusChange);
    focusMobile.addListener(onFocusChange);
    focusMessage.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusNodeName.hasFocus;
    isEmail.value = focusNodeEmail.hasFocus;
    isMobile.value = focusMobile.hasFocus;
    isMessage.value = focusMessage.hasFocus;
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void clickOnSubmitButton() {
    submitMessage();
  }

  Future<void> submitMessage() async {
    if (messageController.text.isNotEmpty &&
        fullNameController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      Map<String, String> queryParameters = {
        // ApiKeyConstants.name : fullNameController.text,
        // ApiKeyConstants.message: messageController.text,
        // ApiKeyConstants.email: emailController.text,
        // ApiKeyConstants.phoneNumber: mobileController.text,
      };
      showLoading.value = true;
      // SupportModel? contactUsModel =
      // await ApiMethods.supportApi(bodyParams: queryParameters);
      // if (contactUsModel != null && contactUsModel.status == '1') {
      //   Get.back();
      //   messageController.text = '';
      //   fullNameController.text = '';
      //   emailController.text = '';
      //   mobileController.text = '';
      //   CommonWidgets.showMyToastMessage(contactUsModel?.message ?? '');
      // } else {
      //   CommonWidgets.showMyToastMessage(contactUsModel?.message ?? '');
      // }
      CommonWidgets.showMyToastMessage(StringConstants.submit ?? '');
      showLoading.value = false;
    } else {
      showLoading.value = false;
      CommonWidgets.showMyToastMessage(StringConstants.allFieldsRequired ?? '');
    }
  }



  void increment() => count.value++;
}
