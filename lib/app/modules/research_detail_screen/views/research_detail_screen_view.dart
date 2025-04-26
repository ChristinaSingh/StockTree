import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/colors.dart';
import 'package:stocktree/app/data/constants/string_constants.dart';
import '../../../common/common_widgets.dart';
import '../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/research_detail_screen_controller.dart';

class ResearchDetailScreenView extends GetView<ResearchDetailScreenController> {
  const ResearchDetailScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                if (controller.gallery.isNotEmpty)
                  CommonWidgets.imageView(
                      height: 314.px,
                      borderRadius: BorderRadius.circular(20.px),
                      image:
                          "https://cdn.pixabay.com/photo/2024/04/12/15/46/beautiful-8692180_1280.png"),
                Padding(
                  padding: EdgeInsets.only(top: 70, right: 16.px, left: 16.px),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            controller.clickOnBackButton(context: context),
                        child: CommonWidgets.appIconsSvg(
                          assetName: IconConstants.icBack,
                          height: 34.px,
                          width: 34.px,
                        ),
                      ),
                      const SizedBox(),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aryan Patel",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 20.px, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20.px),
                  Text(
                    "Marcus Aminoff",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 20.px,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(height: 20.px),
                  Row(
                    children: [
                      CommonWidgets.appIconsSvg(
                        assetName: IconConstants.icTradesUnFillSvg,
                        width: 18.px,
                        color: primaryColor,
                        height: 18.px,
                      ),
                      SizedBox(width: 10.px),
                      Text(
                        "Trades: 10",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.px),
                  Row(
                    children: [
                      CommonWidgets.appIconsSvg(
                        assetName: IconConstants.icProfileUnFillSvg,
                        width: 18.px,
                        color: primaryColor,
                        height: 18.px,
                      ),
                      SizedBox(width: 10.px),
                      Text(
                        "Experience: 10y",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.px),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 20,
                        color: primaryColor,
                      ),
                      SizedBox(width: 10.px),
                      Text(
                        "4.8 (3.279 reviews)",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.px),
                  SizedBox(height: 10.px),
                  Text(
                    "About",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 20.px, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.px),
                  Text(
                    StringConstants.test,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 30.px,
                  ),
                  if (controller.gallery.isNotEmpty)
                    Text(
                      "Portfolio",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 20.px, fontWeight: FontWeight.w600),
                    ),
                  if (controller.gallery.isNotEmpty) SizedBox(height: 10.px),
                  if (controller.gallery.isNotEmpty)
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 80.px,
                      child: ListView.builder(
                        itemCount: controller.gallery.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(right: 15.px),
                            width: 110.px,
                            child: CommonWidgets.imageView(
                                width: 110.px,
                                height: 80.px,
                                borderRadius: BorderRadius.circular(10.px),
                                image: controller.gallery[index]),
                          );
                        },
                      ),
                    ),
                  SizedBox(height: 30.px),
                  Text(
                    "Reviews",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 20.px, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 30.px),
                  Container(
                    height: 155.px,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.px, horizontal: 5.px),
                    padding: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        color: primary3Color,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            offset: const Offset(0, 0),
                            blurRadius: 14,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hanna Dokidis",
                          style: MyTextStyle.titleStyle14bb,
                        ),
                        Text(
                          "very good portfolio very experience balanced and easy to manage portfolio. ",
                          style: MyTextStyle.titleStyle12b,
                        ),
                        Row(
                          children: [
                            RatingBar.readOnly(
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star,
                              filledColor: const Color(0xFFF6D060),
                              emptyColor: const Color(0xFFE2E5EA),
                              size: 20.px,
                              initialRating: double.parse("5"),
                            ),
                            Spacer(),
                            Text(
                              "10",
                              style: MyTextStyle.titleStyle16bb,
                            ),
                            SizedBox(
                              width: 5.px,
                            ),
                          ],
                        ),
                        Text(
                          'View Profile >',
                          style: MyTextStyle.titleStyle12gr,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.px),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
