import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/data/constants/string_constants.dart';

import '../../../common/common_widgets.dart';
import '../../../common/text_styles.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/success_screen_member_ship_controller.dart';

class SuccessScreenMemberShipView
    extends GetView<SuccessScreenMemberShipController> {
  const SuccessScreenMemberShipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.memberShip),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.px),
          child: Column(
            children: [
              SizedBox(
                height: 130.px,
              ),
              Center(
                child: Image.asset(ImageConstants.paymentSuccessfully,
                height:200.px,
                width: 200.px,),
              ),
              SizedBox(
                height: 60.px,
              ),
              Text(
                StringConstants.paymentDone.tr,
                style: MyTextStyle.titleStyle20gr,
              ),
              Spacer(),
              CommonWidgets.commonElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  StringConstants.done.tr,
                  style: MyTextStyle.titleStyle18bw,
                ),
              ),
              SizedBox(
                height: 80.px,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
