import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/support_screen_controller.dart';

class SupportScreenView extends GetView<SupportScreenController> {
  const SupportScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.support),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.px),
          child: Obx(() {
            controller.count.value;
            return ListView(
              children: [
                SizedBox(
                  height: 20.px,
                ),

                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.fullNameController,
                  focusNode: controller.focusNodeName,
                  isCard: controller.isFullName.value,
                  // borderColor: borderColor,
                  hintText: StringConstants.fullName.tr,
                ),

                SizedBox(
                  height: 20.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                  controller: controller.emailController,
                  focusNode: controller.focusNodeEmail,
                  isCard: controller.isEmail.value,
                  // borderColor: borderColor,
                  hintText: StringConstants.emailHint.tr,
                ),
                SizedBox(
                  height: 20.px,
                ),
                SizedBox(
                  height: 20.px,
                ),
                Container(
                  height: 177.px,
                  padding:
                  EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(
                          width: 1.px, color: Colors.black.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(15.px)),
                  child: TextFormField(
                    focusNode: controller.focusMessage,
                    controller: controller.messageController,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.px),
                    keyboardType: TextInputType.text,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: "How can we help?",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.px),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.px,
                ),
                CommonWidgets.commonElevatedButton(
                    onPressed: () {
                      controller.clickOnSubmitButton();
                    },
                    child: Text(
                      StringConstants.submit,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.px),
                    ),
                    showLoading: controller.showLoading.value),
                // showLoading: controller.showLoading.value),
                SizedBox(
                  height: 60.px,
                ),
              ],
            );
          })),
    );
  }
}
