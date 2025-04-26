import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/colors.dart';
import '../../../common/common_widgets.dart';
import '../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_in_screen_controller.dart';

class SignInScreenView extends GetView<SignInScreenController> {
  const SignInScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary3Color,
        resizeToAvoidBottomInset: false,
        body: Obx(() {
          controller.count.value;
          return Container(
            height: MediaQuery.of(context).size.height,
            // constraints:
            //     BoxConstraints(maxHeight: 380.px, minHeight: 320.px),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20.px),
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
                Row(
                  children: [
                    Text(
                      StringConstants.hiThere.tr,
                      style: MyTextStyle.titleStyle20bb,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 5.px,
                    ),
                    CommonWidgets.appIcons(assetName: IconConstants.icHII)
                  ],
                ),
                SizedBox(
                  height: 10.px,
                ),
                Text(
                  StringConstants.welcomeSignMessage.tr,
                  style: MyTextStyle.titleStyleCustom(
                      14.px, FontWeight.w400, textGrey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.px,
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

                      } else {
                        Get.toNamed(Routes.HOME);

                        // CommonWidgets.showMyToastMessage(
                        //     StringConstants.allFieldsRequired);
                      }
                    },
                    child: Text(
                      StringConstants.signIn.tr,
                      style: MyTextStyle.titleStyle18bw,
                    ),
                    showLoading: controller.showLoading.value),
                SizedBox(
                  height: 20.px,
                ),
                CommonWidgets.commonElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.SIGN_UP_SCREEN);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringConstants.doNotHaveAnAccount.tr,
                          style: MyTextStyle.titleStyleCustom(
                              14.px, FontWeight.w500, textGrey2),
                        ),
                        Text(
                          StringConstants.signUp.tr,
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
          );
        }));
  }
}
