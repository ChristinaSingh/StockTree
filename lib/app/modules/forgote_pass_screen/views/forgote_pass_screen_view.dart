import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgote_pass_screen_controller.dart';

class ForgotePassScreenView extends GetView<ForgotePassScreenController> {
  const ForgotePassScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgotePassScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgotePassScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
