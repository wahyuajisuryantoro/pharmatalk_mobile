import 'package:get/get.dart';

import '../controllers/latihan_missing_text_controller.dart';

class LatihanMissingTextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihanMissingTextController>(
      () => LatihanMissingTextController(),
    );
  }
}
