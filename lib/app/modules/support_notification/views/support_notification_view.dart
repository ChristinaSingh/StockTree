import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/colors.dart';

import '../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/support_notification_controller.dart';

class SupportNotificationView extends GetView<SupportNotificationController> {
  const SupportNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CommonWidgets.appBar(
        title: StringConstants.notifications,
      ),
      body: Obx(() {
        controller.count.value;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.px,
              ),
              ListView.builder(
                  itemCount: controller.settingList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            controller.clickOnItem(index);
                          },
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.px, vertical: 0.px),
                          title: Text(
                            controller.settingList[index]['name'] ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.px,
                                  color: Colors.black,
                                ),
                          ),
                          trailing: GestureDetector(
                              onTap: () {
                                controller.clickOnItem(index);
                              },
                              child: Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                  activeTrackColor: primaryColor,
                                  activeColor: primary3Color,
                                  inactiveThumbColor: soft2White,
                                  inactiveTrackColor: unFillGrey,
                                  value: controller.settingList[index]
                                          ['on_off'] ??
                                      false,
                                  onChanged: (value) {
                                    controller.settingList[index]['on_off'] =
                                        value;
                                    controller.increment();
                                  },
                                ),
                              )),
                        ),
                        Divider(
                          indent: 10.px,
                          endIndent: 10.px,
                          thickness: 1.px,
                          color: const Color(0xFFD9D9D9),
                        )
                      ],
                    );
                  })
            ],
          ),
        );
      }),
    );
  }
}
