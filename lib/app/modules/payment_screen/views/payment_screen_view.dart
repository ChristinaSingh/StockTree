import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/text_styles.dart';
import 'package:stocktree/app/data/constants/icons_constant.dart';
import 'package:stocktree/app/data/constants/string_constants.dart';

import '../../../common/common_widgets.dart';
import '../controllers/payment_screen_controller.dart';

class PaymentScreenView extends GetView<PaymentScreenController> {
  const PaymentScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBar(title: StringConstants.payment),
        body: Obx(() {
          controller.count.value;
          return SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.px),
                      Text(
                        "Select the payment method you want to use.",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        "SERVICES",
                        style: MyTextStyle.titleStyle16bb,
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        "Wet Service (Split AC)",
                        style: MyTextStyle.titleStyle14gr,
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rs. 20.00",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.px),
                          ),
                          Text(
                            "01",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.px),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.px),
                      Text(
                        "PAYMENT",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 16.px),
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Service Charge",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            "Rs. 20.00",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub Total",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          Text(
                            "Rs. 00.00",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style:
                                Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.px,
                                    ),
                          ),
                          Text(
                            "Rs. 20.00",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.px),
                      ListView.builder(
                        itemCount: controller.items.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.px),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(14.px),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(4.px),
                                child: Theme(
                                  data: ThemeData(),
                                  child: RadioListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.px),
                                    ),
                                    activeColor: Theme.of(context).primaryColor,
                                    contentPadding: EdgeInsets.zero,
                                    groupValue: controller.selectedMethodId,
                                    value: controller.methodeList[index]
                                            ['on_off'] ??
                                        '',
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    onChanged: (value) => controller.clickOnItem(
                                        context: context,
                                        index: index,
                                        value1: value),
                                    secondary: index == 2
                                        ? CommonWidgets.appIcons(
                                            assetName: IconConstants.icGPay,
                                            width: 50.px,
                                            height: 50.px)
                                        : index == 3
                                            ? CommonWidgets.appIcons(
                                                assetName:
                                                    IconConstants.icApplePay,
                                                width: 50.px,
                                                height: 50.px)
                                            : index == 4
                                                ? CommonWidgets.appIcons(
                                                    assetName: IconConstants
                                                        .icMasterCard,
                                                    width: 50.px,
                                                    height: 50.px)
                                                : CommonWidgets.appIcons(
                                                    assetName:
                                                        IconConstants.icCoin,
                                                    width: 50.px,
                                                    height: 50.px),
                                    title: Text(
                                      controller.items[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                              fontSize: 14.px,
                                              fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20.px),
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
                          showLoading: controller.showLoading.value),
                      SizedBox(height: 10.px),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
