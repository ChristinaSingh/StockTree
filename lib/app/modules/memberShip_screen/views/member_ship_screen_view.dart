import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/text_styles.dart';
import 'package:stocktree/app/data/constants/image_constants.dart';
import 'package:stocktree/app/routes/app_pages.dart';

import '../../../common/colors.dart';
import '../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/member_ship_screen_controller.dart';

class MemberShipScreenView extends GetView<MemberShipScreenController> {
  const MemberShipScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CommonWidgets.appBar(
        title: StringConstants.memberShip,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Text(
              StringConstants.getPremium,
              style: MyTextStyle.titleStyle30gr,
            ),
            SizedBox(height: 8),
            Text(
              'Unlock all the power of this mobile tool and enjoy digital experience like never before!',
              textAlign: TextAlign.center,
              style: MyTextStyle.titleStyle12lb,
            ),
            SizedBox(height: 32),

            // Shaking offer image
            AnimatedBuilder(
              animation: controller.shakeAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(controller.shakeAnimation.value, 0),
                  child: child,
                );
              },
              child: Image.asset(
                ImageConstants.imgMemberShip,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 32),

            // Plan cards
            Obx(() => _buildPlanCard(
                  plan: Plan.annual,
                  title: 'Annual',
                  subtitle: 'First 30 days free – Then \$999/Year',
                  isBest: true,
                )),
            SizedBox(height: 16),
            Obx(() => _buildPlanCard(
                  plan: Plan.monthly,
                  title: 'Monthly',
                  subtitle: 'First 7 days free – Then \$99/Month',
                )),

            Spacer(),

            // Action button
            Obx(
              () {
                final isAnnual = controller.selectedPlan.value == Plan.annual;
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.PAYMENT_SCREEN);
                    },
                    child: Text(
                      'Start ${isAnnual ? '30-day' : '7-day'} free trial',
                      style: MyTextStyle.titleStyle14w,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Text(
              'By placing this order, you agree to the Terms of Service and Privacy Policy. Subscription automatically renews unless auto-renew is turned off at least 24‑hours before the end of the current period.',
              textAlign: TextAlign.center,
              style: MyTextStyle.titleStyle12bGb,
            ),
            Spacer(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required Plan plan,
    required String title,
    required String subtitle,
    bool isBest = false,
  }) {
    final isSelected = controller.selectedPlan.value == plan;
    return GestureDetector(
      onTap: () => controller.selectPlan(plan),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: isSelected ? 1.0 : 0.6,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? primaryColorLite : Colors.white,
            border: Border.all(
              color: isSelected ? primaryColor : Colors.grey,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(16.px),
          ),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              if (isBest)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Best Value',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
