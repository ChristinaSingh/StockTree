import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/common_widgets.dart';
import 'package:stocktree/app/data/constants/icons_constant.dart';
import 'package:stocktree/app/data/constants/image_constants.dart';

import '../controllers/trades_detail_screen_controller.dart';

class TradesDetailScreenView extends GetView<TradesDetailScreenController> {
  const TradesDetailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> timeframes = ['Day', 'Week', 'Month', 'Year', 'All'];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10.px,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CommonWidgets.appIconsSvg(
                        assetName: IconConstants.icBack,
                        height: 30.px,
                        width: 30.px),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(ImageConstants.niftyImg, height: 30),
                      Text('NIFTY 50',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text('BANK NIFTY', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: 20.px,
                  ),
                ],
              ),
              Obx(() => Row(
                    children: [
                      GestureDetector(
                        onTap: () => controller.isProfitTab.value = true,
                        child: Text(
                          'Profit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: controller.isProfitTab.value
                                ? Colors.green
                                : Colors.black,
                            decoration: controller.isProfitTab.value
                                ? TextDecoration.underline
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      GestureDetector(
                        onTap: () => controller.isProfitTab.value = false,
                        child: Text(
                          'News',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: !controller.isProfitTab.value
                                ? Colors.green
                                : Colors.black,
                            decoration: !controller.isProfitTab.value
                                ? TextDecoration.underline
                                : null,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 20),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text('₹113,00',
              //             style: TextStyle(
              //                 fontSize: 30, fontWeight: FontWeight.bold)),
              //         Text('NASDAQ',
              //             style: TextStyle(
              //                 color: Colors.blue, fontWeight: FontWeight.bold))
              //       ],
              //     ),
              //     Text('+1,54 %',
              //         style: TextStyle(color: Color(0xff78CBBB), fontSize: 20))
              //   ],
              // ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  color: Colors.grey[100],
                  width: MediaQuery.sizeOf(context).width,
                  child: CommonWidgets.appIcons(assetName: ImageConstants.chart),
                ),
              ),
              SizedBox(height: 20),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: timeframes
                        .map((time) => GestureDetector(
                              onTap: () =>
                                  controller.selectedTimeframe.value = time,
                              child: Text(
                                time,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      controller.selectedTimeframe.value == time
                                          ? Colors.black
                                          : Colors.grey,
                                ),
                              ),
                            ))
                        .toList(),
                  )),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() => ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: Text(
                          'Buy ${controller.buyPercentage.value}%',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      )),
                  Obx(() => ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: Text(
                          'Sell ${controller.sellPercentage.value}%',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
