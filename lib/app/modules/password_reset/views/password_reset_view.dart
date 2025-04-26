import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/password_reset_controller.dart';

class PasswordResetView extends GetView<PasswordResetController> {
  const PasswordResetView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PasswordResetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PasswordResetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
