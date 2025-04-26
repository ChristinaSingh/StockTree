import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/data/constants/icons_constant.dart';

import '../../../common/colors.dart';
import '../../../common/common_widgets.dart';
import '../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_edit_screen_controller.dart';

class ProfileEditScreenView extends GetView<ProfileEditScreenController> {
  const ProfileEditScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary3Color,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          surfaceTintColor: primary3Color,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text("Trade Market",
                  style: TextStyle(
                      fontSize: 15.px,
                      fontWeight: FontWeight.w700,
                      color: textBlack)),
              SizedBox(
                width: 10.px,
              ),
              Text("Feed",
                  style: TextStyle(
                      fontSize: 15.px,
                      fontWeight: FontWeight.w500,
                      color: primaryColor)),
            ],
          ),
          actions: [
            SizedBox(width: 5.px),
            CommonWidgets.appIconsSvg(
                assetName: IconConstants.icNotifyBadge,
                height: 30.px,
                width: 30.px),
            SizedBox(
              width: 30.px,
            )
          ],
        ),
        body: Obx(() {
          controller.count.value;
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.px),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        controller.selectImage.value != null
                            ? Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(61.px),
                                    color: Colors.white),
                                child: Image.file(
                                  height: 122.px,
                                  width: 122.px,
                                  fit: BoxFit.fill,
                                  File(
                                    controller.selectImage.value!.path
                                        .toString(),
                                  ),
                                ))
                            : CommonWidgets.imageView(
                                image: controller.profileImage.value,
                                height: 102.px,
                                width: 102.px,
                                fit: BoxFit.fill,
                                borderRadius: BorderRadius.circular(65.px),
                                defaultNetworkImage:
                                    StringConstants.defaultNetworkImage),
                        Positioned(
                          bottom: 0.px,
                          right: 15.px,
                          child: Container(
                            padding: EdgeInsets.all(2.px),
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: GestureDetector(
                              onTap: () {
                                controller.pickImages();
                              },
                              child: CommonWidgets.appIcons(
                                  assetName: IconConstants.icEditPIcPng,
                                  height: 20.px,
                                  width: 20.px),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.px,
                    ),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.fullNameController,
                      focusNode: controller.focusNodeName,
                      isCard: controller.isName.value,
                      // borderColor: borderColor,
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      hintText: StringConstants.fullName.tr,
                    ),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.nicknameController,
                      focusNode: controller.focusNodeNickName,
                      isCard: controller.isNickName.value,
                      // borderColor: borderColor,
                      hintText: StringConstants.nickName.tr,
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.dateController,
                        readOnly: true,
                        focusNode: controller.focusNodeDate,
                        isCard: controller.isDate.value,
                        suffixIcon: CommonWidgets.appIconsSvg(
                            assetName: IconConstants.icCalendar,
                            height: 24.px,
                            width: 24.px),
                        // borderColor: borderColor,
                        hintText: StringConstants.dob.tr,
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                        onTap: () {
                          controller.selectDate(context);
                        }),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.emailController,
                      focusNode: controller.focusNodeEmail,
                      isCard: controller.isEmail.value,
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      // borderColor: borderColor,
                      hintText: StringConstants.email.tr,
                    ),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.passwordController,
                      focusNode: controller.focusNodePassword,
                      isCard: controller.isPassword.value,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      //borderRadius: 30.px,
                      horizontalPadding: 0,
                      prefixIconHorizontal: 8,
                      prefixIcon: CommonWidgets.countryCodePicker(
                          onChanged: (value) =>
                              controller.clickOnCountryCode(value: value),
                          initialSelection: controller.countryDailCode.value),
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      // borderColor: borderColor,
                      hintText: StringConstants.phoneNumber.tr,
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 14.px,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
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
                      height: 31.px,
                    ),
                    CommonWidgets.commonElevatedButton(
                        onPressed: () {
                          if (controller.emailController.text
                                  .trim()
                                  .isNotEmpty &&
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
                          StringConstants.update.tr,
                          style: MyTextStyle.titleStyle18bw,
                        ),
                        showLoading: controller.showLoading.value),
                    SizedBox(
                      height: 20.px,
                    ),
                    SizedBox(
                      height: 20.px,
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
