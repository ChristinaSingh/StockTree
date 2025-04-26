import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/routes/app_pages.dart';

import '../../../common/colors.dart';
import '../../../common/common_widgets.dart';
import '../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sign_up_screen_controller.dart';

class SignUpScreenView extends GetView<SignUpScreenController> {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary3Color,
        resizeToAvoidBottomInset: true,
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: EdgeInsets.all(20.px),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70.px,
                  ),
                  CommonWidgets.appIcons(
                      assetName: IconConstants.icLogo,
                      height: 60.px,
                      width: 60.px),
                  SizedBox(
                    height: 30.px,
                  ),
                  Text(
                    StringConstants.sigUpMessage.tr,
                    style: MyTextStyle.titleStyle20bb,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.px,
                  ),
                  Text(
                    StringConstants.sigUpSubMessage.tr,
                    style: MyTextStyle.titleStyleCustom(
                        14.px, FontWeight.w400, textGrey),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 30.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    controller: controller.fullNameController,
                    focusNode: controller.focusNodeName,
                    isCard: controller.isName.value,
                    // borderColor: borderColor,
                    hintText: StringConstants.fullName.tr,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    controller: controller.emailController,
                    focusNode: controller.focusNodeEmail,
                    isCard: controller.isEmail.value,
                    // borderColor: borderColor,
                    hintText: StringConstants.emailHint.tr,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusNodePassword,
                      controller: controller.passwordController,
                      isCard: controller.isPassword.value,
                      obscureText: controller.isHide.value,
                      hintText: StringConstants.password.tr,
                      // prefixIcon: CommonWidgets.appIcons(
                      //     assetName: IconConstants.icLock,
                      //     height: 20.px,
                      //     width: 20.px),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.isHide.value = !controller.isHide.value;
                          controller.increment();
                        },
                        child: Icon(
                          controller.isHide.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 25.px,
                          color: hintColor,
                        ),
                      )),
                  SizedBox(
                    height: 10.px,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: primary3Color,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: borderColor, width: 1.px),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value:
                            controller.timeOffTypes[controller.selectedIndex],
                        icon: Icon(Icons.keyboard_arrow_down_rounded,
                            color: Colors.black),
                        isExpanded: true,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 14.px,
                              color: hintColor,
                            ),
                        dropdownColor: Colors.white,
                        hint: Text("Membership Tier"),
                        onChanged: (String? newValue) {
                          final index =
                              controller.timeOffTypes.indexOf(newValue!);
                          controller.onSelectedItemChanged(index: index);
                        },
                        items: controller.timeOffTypes
                            .map<DropdownMenuItem<String>>(
                              (String type) => DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.px,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //controller.clickOnForgotPassword();
                        },
                        child: Text(
                          StringConstants.forgotYourPassword.tr,
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 14.px,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.px,
                  ),
                  CommonWidgets.commonElevatedButton(
                      onPressed: () {
                        if (controller.emailController.text.trim().isNotEmpty &&
                            controller.passwordController.text
                                .trim()
                                .isNotEmpty) {
                          //controller.clickOnLogin();
                        } else {
                          // CommonWidgets.showMyToastMessage(
                          //     StringConstants.allFieldsRequired);
                          Get.toNamed(Routes.NAV_BAR);
                        }
                      },
                      child: Text(
                        StringConstants.signUp.tr,
                        style: MyTextStyle.titleStyle18bw,
                      ),
                      showLoading: controller.showLoading.value),
                  SizedBox(
                    height: 20.px,
                  ),
                  CommonWidgets.commonElevatedButton(
                      onPressed: () {
                        // controller.clickOnSignUp();
                        Get.toNamed(Routes.SIGN_IN_SCREEN);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringConstants.alreadyMessage.tr,
                            style: MyTextStyle.titleStyleCustom(
                                14.px, FontWeight.w500, textGrey2),
                          ),
                          Text(
                            StringConstants.signIn.tr,
                            style: MyTextStyle.titleStyleCustom(
                                14.px, FontWeight.w700, primaryColor),
                          ),
                        ],
                      ),
                      buttonColor: primary3Color),
                  SizedBox(
                    height: 5.px,
                  ),
                  SizedBox(
                    height: 20.px,
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
