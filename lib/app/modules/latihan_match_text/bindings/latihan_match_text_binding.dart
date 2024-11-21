import 'package:get/get.dart';

import '../controllers/latihan_match_text_controller.dart';

class LatihanMatchTextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihanMatchTextController>(
      () => LatihanMatchTextController(),
    );
  }
}
