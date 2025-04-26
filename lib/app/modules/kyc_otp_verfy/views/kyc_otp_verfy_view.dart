import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/colors.dart';

import '../../../common/common_widgets.dart';
import '../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/kyc_otp_verfy_controller.dart';

class KycOtpVerfyView extends GetView<KycOtpVerfyController> {
  const KycOtpVerfyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary3Color,
        appBar: CommonWidgets.appBar(title: StringConstants.kYC),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.px),
                child: Obx(() {
                  controller.count.value;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30.px,
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.px),
                            decoration: BoxDecoration(
                                color: primary3Color,
                                borderRadius: BorderRadius.circular(27.px),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 30,
                                  spreadRadius: 10,
                                  offset: Offset(2.5, 2.5),
                                ),
                              ],),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 30.px,
                                ),
                                Text(
                                  StringConstants.verifyPhoneNumber,
                                  style: TextStyle(
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.w600,
                                    color: textBlack,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  StringConstants.verifyEmailDescription,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: textBlack,
                                  ),
                                ),
                                SizedBox(
                                  height: 35.px,
                                ),
                                SizedBox(
                                  height: 30.px,
                                ),
                                CommonWidgets.commonOtpView(
                                    controller: controller.pin,
                                    width: 64.px,
                                    height: 64.px),
                                Row(
                                  children: [
                                    Text(
                                      "(00:30)",
                                      style: MyTextStyle.titleStyle14lb,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.px,
                                ),
                                CommonWidgets.commonElevatedButton(
                                  height: 60.px,
                                  borderRadius: 14.px,
                                  onPressed: () {
                                    controller.onClickVerify();
                                  },
                                  child: Text(
                                    StringConstants.verify,
                                    style: MyTextStyle.titleStyle16bw,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.px,
                                ),
                                CommonWidgets.commonElevatedButton(
                                  height: 60.px,
                                  borderColor: primary3Color,
                                  borderRadius: 14.px,
                                  buttonColor: primary3Color,
                                  onPressed: () {
                                    controller.onClickVerify();
                                  },
                                  child: Text(
                                    StringConstants.sendAgain,
                                    style: MyTextStyle.titleStyle16gr,
                                  ),
                                ),
                                SizedBox(
                                  height: 30.px,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }))));
  }
}
