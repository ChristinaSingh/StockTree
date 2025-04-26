import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stock_details_screen_controller.dart';

class StockDetailsScreenView extends GetView<StockDetailsScreenController> {
  const StockDetailsScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StockDetailsScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'StockDetailsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
