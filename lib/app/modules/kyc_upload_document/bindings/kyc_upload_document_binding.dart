import 'package:get/get.dart';

import '../controllers/kyc_upload_document_controller.dart';

class KycUploadDocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KycUploadDocumentController>(
      () => KycUploadDocumentController(),
    );
  }
}
