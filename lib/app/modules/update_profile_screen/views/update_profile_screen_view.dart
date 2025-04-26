import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_profile_screen_controller.dart';

class UpdateProfileScreenView extends GetView<UpdateProfileScreenController> {
  const UpdateProfileScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateProfileScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'UpdateProfileScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
