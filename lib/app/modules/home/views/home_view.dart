import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/colors.dart';
import 'package:stocktree/app/common/common_widgets.dart';
import 'package:stocktree/app/common/text_styles.dart';
import 'package:stocktree/app/data/constants/icons_constant.dart';
import 'package:stocktree/app/data/constants/image_constants.dart';

import '../../../data/constants/string_constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    return Scaffold(
      backgroundColor: primary3Color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CommonWidgets.appIcons(
                assetName: IconConstants.imgHomeAppLogo,
                height: 25.px,
                width: 120),
            const SizedBox(width: 8),
          ],
        ),
        actions: [
          CommonWidgets.commonElevatedButton(
            height: 30.px,
            borderRadius: 5.px,
            width: 130.px,
            onPressed: () {},
            child: Text(
              "AI VOICE ALERT",
              style: MyTextStyle.titleStyle12bw,
            ),
          ),
          SizedBox(width: 10.px),
          Stack(
            children: [
              CommonWidgets.appIconsSvg(
                  assetName: IconConstants.icNotifyBadge,
                  height: 30.px,
                  width: 30.px),
            ],
          ),
          SizedBox(
            width: 30.px,
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text("Portfolio value",
              style: TextStyle(
                  color: hintColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.px)),
          Obx(() {
            controller.count.value;
            return Row(
              children: [
                Text(
                  controller.isValueVisible.value ? "₹ 13,240.11" : "••••••••",
                  style: TextStyle(
                      fontSize: 24.px,
                      fontWeight: FontWeight.w700,
                      color: textBlack),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: hintColor,
                  ),
                  onPressed: controller.toggleVisibility,
                )
              ],
            );
          }),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                marketCard("SS", "Sensex", "78553.20", "+1.96%"),
                SizedBox(
                  width: 12.px,
                ),
                marketCard("N50", "Nifty 50", "23851.65", "+1.71%"),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Center(child: DotIndicator(current: 0, total: 3)),
          const SizedBox(height: 16),
          Text("Watch List",
              style: TextStyle(
                  fontSize: 18.px,
                  fontWeight: FontWeight.w600,
                  color: textBlack)),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                watchListCard(IconConstants.icAmazon, "AMZN", "Amazon, Inc",
                    "-0.05%", "+0.05%"),
                SizedBox(width: 12.px),
                watchListCard(IconConstants.icAdobe, "Adobe", "Adobe, Inc",
                    "", "+0.32%"),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Center(child: DotIndicator(current: 0, total: 3)),
          const SizedBox(height: 20),
          Text("Stocks",
              style:
              TextStyle(fontSize: 18.px, fontWeight: FontWeight.w600,
                  color: textBlack)),
          const SizedBox(height: 8),
          stockRow(IconConstants.icNetflix, "NFLX", "Netflix, Inc", "\$88.91",
              "+1.29%"),
          stockRow(IconConstants.icApple, "AAPL", "Apple, Inc", "\$142.65",
              "+0.81%"),
          stockRow(IconConstants.icFacebook, "FB", "Facebook, Inc", "\$343.01",
              "+1.07%"),
        ],
      ),
    );
  }

  Widget marketCard(String code, String name, String value, String change) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: soft2White,
            child: Padding(
                padding: EdgeInsets.all(8.px),
                child: Text(
                  code,
                  style: MyTextStyle.titleStyleCustom(
                      10.px, FontWeight.w700, textBlackLite),
                )),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              Text(name),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(width: 10),
          Text(change,
              style: MyTextStyle.titleStyleCustom(
                  10.px, FontWeight.w600, primaryColor)),
        ],
      ),
    );
  }

  Widget watchListCard(
      String logoPath, String code, String company, String down, String up) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(code,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(company, style: const TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (down.isNotEmpty)
                Padding(
                    padding: EdgeInsets.only(right: 30.px),
                    child: Text(down, style: const TextStyle(color: redG))),
              Text(up, style: const TextStyle(color: primaryColor)),
            ],
          )
        ],
      ),
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

class DotIndicator extends StatelessWidget {
  final int current;
  final int total;

  const DotIndicator({required this.current, required this.total, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          total,
          (index) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: index == current ? 10 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: index == current ? Colors.green : Colors.grey[300],
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ));
  }
}
