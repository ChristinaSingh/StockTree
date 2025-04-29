import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/text_styles.dart';

import '../../../common/colors.dart';
import '../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return WillPopScope(
        onWillPop: () async {
          return await controller.onClickBack();
        },
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: primary3Color,
          body: controller.body(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primary3Color,
                  softWhite,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 18.px, vertical: 10.px),
                child: GNav(
                  padding:
                      EdgeInsets.symmetric(horizontal: 2.px, vertical: 4.px),
                  tabs: [
                    button(
                        selectImage: "Search",
                        image: IconConstants.icSearchUnFillSvg,
                        width: 60.px,
                        height: 50.px,
                        index: 0),
                    button(
                        selectImage: "Trades",
                        image: IconConstants.icTradesUnFillSvg,
                        width: 60.px,
                        height: 50.px,
                        index: 1),
                    button(
                        selectImage: "Home",
                        image: IconConstants.icHomeUnFillSvg,
                        width: 60.px,
                        height: 50.px,
                        index: 2),
                    button(
                        selectImage: "Research",
                        image: IconConstants.icResearchUnFillSvg,
                        width: 65.px,
                        height: 50.px,
                        index: 3),
                    button(
                        selectImage: "Profile",
                        image: IconConstants.icProfileUnFillSvg,
                        width: 60.px,
                        height: 50.px,
                        index: 4),
                  ],
                  selectedIndex: selectedIndex.value,
                  onTabChange: (index) {
                    selectedIndex.value = index;
                    controller.increment();
                  },
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

button({
  required String selectImage,
  required String image,
  required double width,
  required double height,
  required int index,
}) {
  return GButton(
    icon: Icons.add,
    leading: selectedIndex.value == index
        ? Container(
            height: height,
            padding: EdgeInsets.all(3),
            width: width,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(5.px)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonWidgets.appIconsSvg(
                  assetName: image,
                  color: selectedIndex.value == index ? primary3Color : null,
                  width: 24,
                  height: 24,
                ),
                Text(
                  selectImage,
                  style: MyTextStyle.titleStyleCustom(
                    10.px,
                    FontWeight.w700,
                    selectedIndex.value == index ? primary3Color : unFillGrey,
                  ),
                )
              ],
            ),
          )
        : CommonWidgets.appIconsSvg(
            assetName: image,
            color: selectedIndex.value == index ? primaryColor : null,
            width: 24,
            height: 24,
          ),
  );
}
