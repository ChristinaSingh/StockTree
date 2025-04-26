import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpScreenController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  FocusNode focusNodePassword = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodeName = FocusNode();
  final isPassword = false.obs;
  final isEmail = false.obs;
  final isName = false.obs;
  final isHide = true.obs;
  final isCheck = false.obs;
  final count = 0.obs;
  final tabIndex = 0.obs;
  final showLoading = false.obs;
  String? deviceToken;
  int selectedIndex = 0;

  void startListener() {
    focusNodeEmail.addListener(onFocusChange);
    focusNodePassword.addListener(onFocusChange);
    focusNodeName.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusNodeEmail.hasFocus;
    isPassword.value = focusNodePassword.hasFocus;
    isName.value = focusNodeName.hasFocus;
  }

  final List<String> timeOffTypes = [
    'Membership Tier',
    'Free trial',
    'Paid subscription',
  ];


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
