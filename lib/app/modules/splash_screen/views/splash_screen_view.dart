import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/colors.dart';
import '../../../common/common_widgets.dart';
import '../../../common/responsive_size.dart';
import '../../../common/spiral_loader.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      controller.count.value;
      return SafeArea(
        child: !controller.isLoading.value
            ? Center(
                child: CommonWidgets.appIcons(
                assetName: ImageConstants.imgLogo,
                height: ResponsiveSize.height(context, 140),
                width: MediaQuery.sizeOf(context).width - 60,
              ))
            : Center(child: SpiralLoader()),
      );
    }));
  }
}
