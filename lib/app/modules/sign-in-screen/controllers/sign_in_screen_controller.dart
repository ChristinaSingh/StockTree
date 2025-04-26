import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInScreenController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  final isPassword = false.obs;
  final isEmail = false.obs;
  final isHide = true.obs;
  final isCheck = false.obs;
  final count = 0.obs;
  final tabIndex = 0.obs;
  final showLoading = false.obs;
  String? deviceToken;

  void startListener() {
    focusNodeEmail.addListener(onFocusChange);
    focusNodePassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusNodeEmail.hasFocus;
    isPassword.value = focusNodePassword.hasFocus;
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
