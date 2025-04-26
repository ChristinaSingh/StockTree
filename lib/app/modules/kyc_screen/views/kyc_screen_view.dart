import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/colors.dart';
import 'package:stocktree/app/common/text_styles.dart';
import 'package:stocktree/app/routes/app_pages.dart';

import '../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/kyc_screen_controller.dart';

class KycScreenView extends GetView<KycScreenController> {
  const KycScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CommonWidgets.appBar(title: StringConstants.kYC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Details to provide',
                style: MyTextStyle.titleStyleCustom(
                    18.px, FontWeight.w600, textBlack3)),
            SizedBox(height: 4),
            Text(
              'The following are information we want from you.',
              style: MyTextStyle.titleStyleCustom(
                  14.px, FontWeight.w400, textGrey4),
            ),
            SizedBox(height: 24),

            // Animated card
            InkWell(
              onTap: () {
               Get.toNamed(Routes.KYC_FILL_DETAILS_SCREEN);
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    // pulsing emoji
                    AnimatedBuilder(
                      animation: controller.scaleAnimation,
                      builder: (ctx, child) {
                        return Transform.scale(
                          scale: controller.scaleAnimation.value,
                          child: child,
                        );
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.green.shade50,
                        child: Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.green,
                          size: 28,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    // text column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID Card Verification',
                            style: MyTextStyle.titleStyleCustom(
                                14.px, FontWeight.w700, primaryColor),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Provide us with a passport photograph and Valid ID card.',
                            style: MyTextStyle.titleStyleCustom(
                                14.px, FontWeight.w400, textGrey4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Spacer(),
          ],
        ),
      ),

    );
  }
}
