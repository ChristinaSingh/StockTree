import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/colors.dart';

import '../../../common/common_widgets.dart';
import '../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/about_screen_controller.dart';

class AboutScreenView extends GetView<AboutScreenController> {
  const AboutScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CommonWidgets.appBar(title: StringConstants.aboutUs),
        body: Obx(() {
          controller.count.value;
          return ProgressBar(
            inAsyncCall: controller.inAsyncCall.value,
            child: SafeArea(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 24.px, vertical: 5.px),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.px,
                      ),
                      Center(
                          child: Image.asset(
                        'assets/images/About_Illustration.png',
                        fit: BoxFit.cover,
                      )),
                      Text(
                        'App About Details',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10.px,
                      ),
                      Text(
                        StringConstants.test,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: unFillGrey),
                      ),
                      SizedBox(
                        height: 30.px,
                      ),
                      Text(
                        'App Usage',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10.px,
                      ),
                      Text(
                        StringConstants.test,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: unFillGrey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
