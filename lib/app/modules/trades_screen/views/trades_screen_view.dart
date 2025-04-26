import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocktree/app/common/text_styles.dart';

import '../../../common/colors.dart';
import '../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/trades_screen_controller.dart';

class TradesScreenView extends GetView<TradesScreenController> {
  const TradesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! > 0) {
            // Swiped Right
            print("Swiped Right");
            // Example: Navigate to previous screen
            // Get.back();
          } else if (details.primaryVelocity! < 0) {
            // Swiped Left
            print("Swiped Left");
            // Example: Navigate to next screen
            // Get.toNamed(Routes.NEXT_SCREEN);
          }
        }
      },
      child: Scaffold(
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
              SizedBox(width: 10.px),
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
            SizedBox(width: 30.px),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TabBarWidget(),
              SizedBox(height: 16),
              StockListWidget(),
              SizedBox(height: 24),
              IndicesWidget(),
              SizedBox(height: 24),
              StocksSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            indicatorWeight: 3.px,
            indicatorPadding: EdgeInsets.all(6.px),
            automaticIndicatorColorAdjustment: false,
            indicatorSize: TabBarIndicatorSize.tab,
            // onTap: (value) =>
            //     controller.clickOnTap(value: value, context: context),
            labelStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 12.px, color: Theme.of(context).primaryColor),
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 12.px, fontWeight: FontWeight.w700),
            dividerColor: Theme.of(context).colorScheme.surface,
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.symmetric(horizontal: 5.px),
            tabs: [
              Tab(text: 'Equity'),
              Tab(text: 'Derivatives'),
              Tab(text: 'Commodity'),
              Tab(text: 'Currency'),
            ],
          ),
        ],
      ),
    );
  }
}

class StockListWidget extends StatelessWidget {
  const StockListWidget({super.key});

  final List<Map<String, dynamic>> stocks = const [
    {'name': 'AT&T Inc.', 'price': '32,445 \$', 'change': '+0,09 %'},
    {'name': 'MSCI Inc.', 'price': '233,600 \$', 'change': '+0,05 %'},
    {'name': 'Cisco Systems', 'price': '56,205 \$', 'change': '+0,30 %'},
    {'name': '3M Co.', 'price': '171,590 \$', 'change': '-0,13 %'},
    {'name': 'Apple Inc.', 'price': '198,350 \$', 'change': '+0,03 %'},
    {'name': 'Blackrock Inc.', 'price': '452,910 \$', 'change': '+0,78 %'},
    {'name': 'Microsoft Corp.', 'price': '135.040 \$', 'change': '-0,09 %'},
    {'name': 'Zoom Video Commu...', 'price': '88,847 \$', 'change': '+0,20 %'},
    {'name': 'Beyond Meat Inc.', 'price': '113,00 \$', 'change': '+1,54 %'},
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed(Routes.TRADES_DETAIL_SCREEN);
      },
      child: Column(
        children: stocks
            .map(
              (stock) => Container(
                color: stocks.indexOf(stock).isEven
                    ? Colors.transparent
                    : borderColor,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 6.px,
                    ),
                    Text(stock['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.px,
                            color: textBlack)),
                    Text(stock['price'],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.px,
                            color: textBlack)),
                    Text(
                      stock['change'],
                      style: TextStyle(
                          color: stock['change'].toString().contains('-')
                              ? Colors.red
                              : upMarketColor),
                    ),
                    SizedBox(
                      width: 6.px,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class IndicesWidget extends StatelessWidget {
  const IndicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Indices',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              IndexCard(
                  title: 'SEXSEX',
                  subtitle: 'S&P 500 INDEX',
                  value: '4204.12',
                  change: '+0.08%'),
              IndexCard(
                  title: 'NIFTY 50',
                  subtitle: 'DOW JONES IND...',
                  value: '34529.46',
                  change: '+0.19%'),
              IndexCard(
                  title: 'DAX',
                  subtitle: 'DAX INDEX',
                  value: '15519.980',
                  change: '+0.74%'),
            ],
          ),
        ],
      ),
    );
  }
}

class IndexCard extends StatelessWidget {
  final String title, subtitle, value, change;

  const IndexCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.change});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle, style: const TextStyle(fontSize: 10)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(
              children: [
                const Icon(Icons.arrow_upward, size: 12, color: primaryColor),
                Text(change, style: const TextStyle(color: primaryColor)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class StocksSectionWidget extends StatelessWidget {
  const StocksSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Stocks',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('India Exchanges stock status in  year'),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ToggleButtons(
                //   isSelected: const [true, false, false],
                //   children: [
                //
                //     Text('Gainers'),
                //     Text('Gainers'),
                //     Text('Losers')
                //   ],
                //   onPressed: (_) {},
                // ),
                Row(
                  children: [
                    Container(
                      height: 34.px,
                      width: 80.px,
                      padding: EdgeInsets.all(8.px),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6.px)),
                      child: Center(
                        child: Text(
                          'Active',
                          style: MyTextStyle.titleStyle14bw,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.px,
                    ),
                    Container(
                      height: 34.px,
                      width: 80.px,
                      padding: EdgeInsets.all(8.px),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6.px)),
                      child: Center(
                        child: Text(
                          'Gainers',
                          style: MyTextStyle.titleStyle14bw,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.px,
                    ),
                    Container(
                      height: 34.px,
                      width: 80.px,
                      padding: EdgeInsets.all(8.px),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6.px)),
                      child: Center(
                        child: Text(
                          'Losers',
                          style: MyTextStyle.titleStyle14bw,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const StockEntry(
                    title: 'SENSEX',
                    value: '47.91',
                    change: '+0.19%',
                    subtitle: 'AMC ENTERTAINMENT Holding'),
                const StockEntry(
                    title: 'NIFTY 50',
                    value: '2.91',
                    change: '-0.09%',
                    subtitle: 'SENSEONICS HOLDINGS, INC'),
                const StockEntry(
                    title: 'BB',
                    value: '13.86',
                    change: '+1.03%',
                    subtitle: 'BLACKBERRY Limited'),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('More active stocks',
                        style: TextStyle(color: primaryColor)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StockEntry extends StatelessWidget {
  final String title, subtitle, value, change;

  const StockEntry(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.change});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(fontSize: 10)),
            ],
          ),
          Row(
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 5),
              Icon(
                  change.contains('-')
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                  color: change.contains('-') ? Colors.red : primaryColor,
                  size: 14),
              Text(change,
                  style: TextStyle(
                      color: change.contains('-') ? Colors.red : primaryColor)),
            ],
          )
        ],
      ),
    );
  }
}
