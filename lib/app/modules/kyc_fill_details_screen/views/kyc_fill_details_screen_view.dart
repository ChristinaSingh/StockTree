import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/colors.dart';
import 'package:stocktree/app/common/text_styles.dart';

import '../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/kyc_fill_details_screen_controller.dart';

class KycFillDetailsScreenView extends GetView<KycFillDetailsScreenController> {
  const KycFillDetailsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.kYC),
      body: Obx((){
        controller.count.value;
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 30.px),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20.px),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.px),
                      color: primary3Color,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 30,
                          spreadRadius: 10,
                          offset: Offset(2.5, 2.5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID Card type',
                              style: MyTextStyle.titleStyleCustom(
                                  14.px, FontWeight.w500, textGrey5)),
                          SizedBox(height: 8),
                          Obx(() => DropdownButtonFormField<String>(
                            value: controller.selectedType.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                            ),
                            items: controller.types
                                .map((t) => DropdownMenuItem(
                                value: t,
                                child: Text(
                                  t,
                                  style: MyTextStyle.titleStyleCustom(
                                      16.px, FontWeight.w400, textGrey4),
                                )))
                                .toList(),
                            onChanged: (v) =>
                            controller.selectedType.value = v!,
                          )),
                          SizedBox(height: 16),
                          Text('ID Number',
                              style: MyTextStyle.titleStyleCustom(
                                  14.px, FontWeight.w500, textGrey5)),
                          SizedBox(height: 8),
                          Obx(() => TextFormField(
                            initialValue: controller.idNumber.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: '0000 000 0000',
                              hintStyle: MyTextStyle.titleStyleCustom(
                                  16.px, FontWeight.w400, textGrey4),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (v) => controller.idNumber.value = v,
                          )),
                          SizedBox(height: 16),
                          Text('Expiry date',
                              style: MyTextStyle.titleStyleCustom(
                                  14.px, FontWeight.w500, textGrey5)),
                          SizedBox(height: 8),
                          Obx(() {
                            final dt = controller.expiryDate.value;
                            final text = dt != null
                                ? '${dt.day.toString().padLeft(2, '0')}-'
                                '${_monthName(dt.month)}-${dt.year}'
                                : '01-OCT-1960';
                            return GestureDetector(
                              onTap: () => controller.pickExpiryDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText: 'DD-MMM-YYYY',
                                    hintStyle: MyTextStyle.titleStyleCustom(
                                        16.px, FontWeight.w400, textGrey4),
                                  ),
                                  controller: TextEditingController(text: text),
                                ),
                              ),
                            );
                          }),
                          SizedBox(height: 24),

                          GestureDetector(
                            onTap: () {
                              controller.pickImages();
                            },
                            child: Container(
                              padding: EdgeInsets.all(20.px),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.px),
                                color: primary3Color,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(20.px),
                                dashPattern: [8.px],
                                color: Theme.of(context).primaryColor,
                                strokeWidth: 1.4,
                                child: SizedBox(
                                  height: 200.px,
                                  width: double.infinity,
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Positioned(
                                        left: 10,
                                        top: 10,
                                        child: Text('Upload a valid ID Card',
                                            style: MyTextStyle.titleStyleCustom(
                                                14.px,
                                                FontWeight.w400,
                                                textGrey5)),
                                      ),
                                      Container(
                                        height: 150.px,
                                        margin: EdgeInsets.all(10.px),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(20.px),
                                          border: Border.all(
                                              color: unFillGrey, width: 1.px),
                                        ),
                                        child: controller.selectImage.value !=
                                            null
                                            ? Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    10.px),
                                                color: Colors.white),
                                            child: Stack(
                                              alignment: Alignment.topRight,
                                              children: [

                                                Image.file(

                                                  fit: BoxFit.fill,
                                                  File(
                                                    controller
                                                        .selectImage.value!.path
                                                        .toString(),
                                                  ),
                                                ),
                                                CommonWidgets.appIcons(
                                                    assetName: IconConstants
                                                        .icImageUpload,
                                                    width: 40.px,
                                                    height: 40.px),


                                              ],
                                            )
                                        )
                                            : Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            CommonWidgets.appIcons(
                                                assetName: IconConstants
                                                    .icImageUpload,
                                                width: 40.px,
                                                height: 40.px),
                                            SizedBox(height: 15.px),
                                            Text(
                                              'Click to upload',
                                              style: MyTextStyle
                                                  .titleStyleCustom(
                                                  16.px,
                                                  FontWeight.w600,
                                                  primaryColor),
                                            ),
                                            SizedBox(
                                              height: 4.px,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 60.px),
                                              child: Text(
                                                'SVG, PNG, JPG or GIF (max. 800x400px)',
                                                textAlign: TextAlign.center,
                                                style: MyTextStyle
                                                    .titleStyleCustom(
                                                    12.px,
                                                    FontWeight.w400,
                                                    textGrey5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // Obx(() {
                          //   final path = controller.filePath.value;
                          //   return GestureDetector(
                          //     onTap: controller.pickFile,
                          //     child: Container(
                          //       width: double.infinity,
                          //       height: 140,
                          //       decoration: BoxDecoration(
                          //         border: Border.all(color: Colors.grey.shade300),
                          //         borderRadius: BorderRadius.circular(8),
                          //       ),
                          //       child: path == null
                          //           ? Column(
                          //               mainAxisAlignment: MainAxisAlignment.center,
                          //               children: [
                          //                 Icon(Icons.cloud_upload,
                          //                     size: 32, color: Colors.grey),
                          //                 SizedBox(height: 8),
                          //                 Text('Click to upload',
                          //                     style: theme.textTheme.subtitle1
                          //                         ?.copyWith(color: Colors.green)),
                          //                 SizedBox(height: 4),
                          //                 Text('SVG, PNG, JPG or GIF (max. 800×400px)',
                          //                     style: theme.textTheme.caption),
                          //               ],
                          //             )
                          //           : ClipRRect(
                          //               borderRadius: BorderRadius.circular(8),
                          //               child: Image.file(File(path), fit: BoxFit.cover),
                          //             ),
                          //     ),
                          //   );
                          // }),
                          SizedBox(height: 16),
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
                          ),
                          SizedBox(height: 10.px),
                          // CommonWidgets.commonElevatedButton(
                          //   borderColor: primaryColor,
                          //   buttonColor: primary3Color,
                          //   onPressed: () {
                          //    Get.back();
                          //   },
                          //   child: Text(
                          //     StringConstants.later,
                          //     style: TextStyle(
                          //         color: primaryColor,
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 18.px),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      })



    );
  }

  String _monthName(int m) {
    const names = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];
    return names[m - 1];
  }
}

/// Helper to show the modal:
// void showIdCardModal() {
//   Get.dialog(IdCardModal());
// }
