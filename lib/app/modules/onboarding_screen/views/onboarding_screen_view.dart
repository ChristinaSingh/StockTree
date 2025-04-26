import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stocktree/app/data/constants/image_constants.dart';

import '../../../common/colors.dart';
import '../../../common/common_widgets.dart';
import '../../../common/responsive_size.dart';
import '../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: primary3Color,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.px),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Get.offAllNamed('/sign-in-screen'); // Skip to Home screen
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 16.px,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                /// PageView for swiping screens
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: (index) {
                      controller.currentPage = index;
                      controller.increment();
                    },
                    children: [
                      buildPage3(
                          title: "Stock trading suit",
                          description:
                              "Streamline your investment decisions with expert guidance.",
                          image: ImageConstants.imageWelcome1,
                          context: context),
                      buildPage3(
                          title: "Boost your profits",
                          description:
                              "Sign in or create an account to unlock all features!",
                          image: ImageConstants.imageWelcome2,
                          context: context),
                    ],
                  ),
                ),

                SizedBox(height: ResponsiveSize.height(context, 50.px)),

                /// Next Button
                // Padding(
                //   padding: const EdgeInsets.all(24.0),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       if (controller.currentPage == 2) {
                //         Get.offAllNamed(
                //             '/home'); // Move to home screen after last page
                //       } else {
                //         controller.pageController.nextPage(
                //           duration: Duration(milliseconds: 400),
                //           curve: Curves.easeInOut,
                //         );
                //       }
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: primaryColor,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(15),
                //       ),
                //       padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                //     ),
                //     child: Text(
                //       controller.currentPage == 2 ? "Get Started" : "Next",
                //       style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white),
                //     ),
                //   ),
                // ),

                AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    // Smooth animation duration
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: Row(
                      key: ValueKey('rowButtons'), // Unique key for animation
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CommonWidgets.commonElevatedButton(
                            onPressed: () {
                              Get.toNamed('/sign-in-screen');
                            },
                            border:
                                Border.all(color: primaryColor, width: 1.px),
                            borderRadius: 15.px,
                            buttonColor: primary3Color,
                            child: Text(
                              "Sign In",
                              style: MyTextStyle.titleStyleCustom(
                                  14, FontWeight.w600, primaryColor),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: CommonWidgets.commonElevatedButton(
                            onPressed: () {
                              Get.toNamed('/sign-up-screen');
                            },
                            child: Text(
                              "Sign Up",
                              style: MyTextStyle.titleStyleCustom(
                                  14, FontWeight.w600, primary3Color),
                            ),
                          ),
                        ),
                      ],
                    )),

                SizedBox(
                  height: 60.px,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  /// Widget to build each welcome page
  Widget buildPage(
      {required String title,
      required String description,
      required String image,
      required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(image,
            height: ResponsiveSize.height(context, 400.px),
            width: ResponsiveSize.width(context, 400.px)),
        SizedBox(height: ResponsiveSize.height(context, 45.px)),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            description,
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPage3(
      {required String title,
      required String description,
      required String image,
      required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: ResponsiveSize.height(context, 90.px)),
        Image.asset(
          image,
          height: ResponsiveSize.height(context, 245.px),
          width: ResponsiveSize.width(context, 245.px),
          fit: BoxFit.cover,
        ),
        SizedBox(height: ResponsiveSize.height(context, 45.px)),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Text(
            description,
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 25.px),
        SmoothPageIndicator(
          controller: controller.pageController,
          count: 2,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: primaryColor,
            dotColor: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
