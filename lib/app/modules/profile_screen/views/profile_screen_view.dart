import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../common/colors.dart';
import '../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {
  const ProfileScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ProfileScreenController>(
      () => ProfileScreenController(),
    );

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
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
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          controller.fullName.value ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 19.px,
                                color: Colors.black,
                              ),
                        ),
                        SizedBox(
                          height: 5.px,
                        ),
                        Text(
                          controller.emailName.value ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.px,
                                color: hintColor,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    ListView.builder(
                        itemCount: controller.settingList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  controller.clickOnItem(index);
                                },
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.px, vertical: 0.px),
                                title: Text(
                                  controller.settingList[index]['name'] ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.px,
                                        color: Colors.black,
                                      ),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    controller.clickOnItem(index);
                                  },
                                  child: Icon(Icons.arrow_forward_ios,
                                      size: 20, color: Colors.black),
                                ),
                                leading: Container(
                                  height: 40.px,
                                  width: 40.px,
                                  padding: EdgeInsets.all(8.px),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                       primaryColor,greenColor
                                        ],
                                        // Change to your preferred colors
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                      shape: BoxShape.circle),
                                  child: CommonWidgets.appIconsSvg(
                                    assetName: controller.settingList[index]
                                            ['image'] ??
                                        '',
                                    height: 20.px,
                                    width: 20.px,
                                  ),
                                ),
                              ),
                              Divider(
                                indent: 10.px,
                                endIndent: 10.px,
                                thickness: 1.px,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              )
                            ],
                          );
                        }),
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
