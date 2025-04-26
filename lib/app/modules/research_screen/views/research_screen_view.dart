import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/colors.dart';
import 'package:stocktree/app/routes/app_pages.dart';

import '../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/research_screen_controller.dart';

class ResearchScreenView extends GetView<ResearchScreenController> {
  const ResearchScreenView({super.key});


  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ResearchScreenController>(
          () => ResearchScreenController(),
    );


    return Scaffold(
      backgroundColor: primary3Color,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        surfaceTintColor: primary3Color,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text("Trade Market",
                style: TextStyle(
                    fontSize: 15.px,
                    fontWeight: FontWeight.w700,
                    color: textBlack)),
            SizedBox(
              width: 10.px,
            ),
            Text("Feed",
                style: TextStyle(
                    fontSize: 15.px,
                    fontWeight: FontWeight.w500,
                    color: primaryColor)),
          ],
        ),
        actions: [
          SizedBox(width: 5.px),
          CommonWidgets.appIconsSvg(
              assetName: IconConstants.icNotifyBadge,
              height: 30.px,
              width: 30.px),
          SizedBox(
            width: 30.px,
          )
        ],
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.traders.length,
        itemBuilder: (context, index) {
          final trader = controller.traders[index];
          return GestureDetector(
            onTap: (){
              Get.toNamed(Routes.RESEARCH_DETAIL_SCREEN);
            },
              child: TraderCard(trader: trader));
        },
      )),
    );
  }
}

class TraderCard extends StatelessWidget {
  final Trader trader;

  const TraderCard({Key? key, required this.trader}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  trader.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          trader.name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                        ),
                        if (trader.online)
                          Text(
                            'Online',
                            style: TextStyle(
                                color: greenColor,
                                fontWeight: FontWeight.bold),
                          ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star, color: primaryColor, size: 18),
                        SizedBox(width: 5),
                        Text('${trader.rating} (${trader.reviews} reviews)'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.show_chart, size: 16),
                        SizedBox(width: 5),
                        Text('Trades: ${trader.trades}'),
                        SizedBox(width: 15),
                        Icon(Icons.person, size: 16),
                        SizedBox(width: 5),
                        Text('Experience: ${trader.experience}y'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            'With over ${trader.experience} years of experience, I specialize in options trading, IPO investments, and portfolio management. I’ve delivered consistent 15% annual returns, authored market analysis reports, ',
            style: TextStyle(fontSize: 14),
          ),
          Text(
            'See More....',
            style: TextStyle(
                fontSize: 14, color: primaryColor, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
