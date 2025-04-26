import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/kyc_upload_document_controller.dart';

class KycUploadDocumentView extends GetView<KycUploadDocumentController> {
  const KycUploadDocumentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KycUploadDocumentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KycUploadDocumentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
