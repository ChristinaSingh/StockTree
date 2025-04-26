import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/colors.dart';

import '../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<SearchScreenController>(
      () => SearchScreenController(),
    );

    return Scaffold(
      backgroundColor: primary3Color,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Row(
                children: [
                  Expanded(
                    child: CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.nameController,
                        focusNode: controller.focusNodeName,
                        isCard: controller.isName.value,
                        borderRadius: 65.px,
                        borderColor2: primaryColor,
                        fillColor: primary3Color,
                        hintText: StringConstants.search,
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 14.px,
                            fontWeight: FontWeight.w500),
                        //labelText: StringConstants.fullName,
                        keyboardType: TextInputType.name,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(right: 12.px),
                          child: CommonWidgets.appIconsSvg(
                              assetName: IconConstants.icSearch,
                              height: 24.px,
                              width: 26.px),
                        )),
                  ),
                  const SizedBox(width: 12),
                  CommonWidgets.appIcons(
                      assetName: IconConstants.icFilter,
                      height: 41.px,
                      width: 41.px),
                ],
              ),
              const SizedBox(height: 10),

              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CommonWidgets.appIconsSvg(
                            assetName: IconConstants.icResend),
                        SizedBox(
                          width: 10.px,
                        ),
                        Text("Recent",
                            style: TextStyle(
                                fontSize: 14.px,
                                fontWeight: FontWeight.w600,
                                color: borderColor)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    stockRow(IconConstants.icNetflix, "NFLX", "Netflix, Inc",
                        "\$88.91", "+1.29%"),
                    stockRow(IconConstants.icApple, "AAPL", "Apple, Inc",
                        "\$142.65", "+0.81%"),
                    stockRow(IconConstants.icFacebook, "FB", "Facebook, Inc",
                        "\$343.01", "+1.07%"),
                    const SizedBox(height: 30),
                    Text("Stocks",
                        style: TextStyle(
                            fontSize: 18.px,
                            fontWeight: FontWeight.w600,
                            color: textBlack)),
                    const SizedBox(height: 8),
                    stockRow(IconConstants.icNetflix, "NFLX", "Netflix, Inc",
                        "\$88.91", "+1.29%"),
                    stockRow(IconConstants.icApple, "AAPL", "Apple, Inc",
                        "\$142.65", "+0.81%"),
                    stockRow(IconConstants.icFacebook, "FB", "Facebook, Inc",
                        "\$343.01", "+1.07%"),
                    stockRow(IconConstants.icApple, "AAPL", "Apple, Inc",
                        "\$142.65", "+0.81%"),
                    stockRow(IconConstants.icFacebook, "FB", "Facebook, Inc",
                        "\$343.01", "+1.07%"),
                  ],
                ),
              ),

              // Drafts List
              // Expanded(
              //   child: Obx(() {
              //     return ListView.builder(
              //       itemCount: controller.drafts.length,
              //       itemBuilder: (context, index) {
              //         final draft = controller.drafts[index];
              //         return Container(
              //           margin: const EdgeInsets.only(bottom: 12),
              //           padding: const EdgeInsets.symmetric(
              //             horizontal: 16,
              //             vertical: 14,
              //           ),
              //           decoration: BoxDecoration(
              //             color: Colors.white.withOpacity(0.5),
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Expanded(
              //                 child: Text(
              //                   draft,
              //                   style: const TextStyle(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w500,
              //                   ),
              //                 ),
              //               ),
              //               const SizedBox(width: 12),
              //               CommonWidgets.appIconsSvg(
              //                   assetName: IconConstants.icEditDraftIcon,
              //                   height: 22.px,
              //                   width: 22.px),
              //               const SizedBox(width: 12),
              //               GestureDetector(
              //                 // onTap: () => controller.deleteDraft(index),
              //                 child: CommonWidgets.appIconsSvg(
              //                     assetName: IconConstants.icDelete,
              //                     height: 24.px,
              //                     width: 24.px),
              //               ),
              //             ],
              //           ),
              //         );
              //       },
              //     );
              //   }),
              // ),
            ],
          ),
        ),
      ),

      // Bottom Navigation
    );
  }

  Widget stockRow(
      String logoPath, String code, String name, String price, String change) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(8.px),
              height: 40.px,
              width: 40.px,
              decoration: BoxDecoration(
                color: soft2White,
                shape: BoxShape.circle,
              ),
              child: CommonWidgets.appIconsSvg(
                assetName: logoPath,
              )),
          const SizedBox(width: 8),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(code, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(name, style: const TextStyle(color: Colors.grey)),
          ]),
          const Spacer(),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(change, style: const TextStyle(color: Colors.green)),
          ]),
        ],
      ),
    );
  }
}
