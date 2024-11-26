import 'package:get/get.dart';

import '../controllers/latihan_arrange_text_controller.dart';

class LatihanArrangeTextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatihanArrangeTextController>(
      () => LatihanArrangeTextController(),
    );
  }
}
