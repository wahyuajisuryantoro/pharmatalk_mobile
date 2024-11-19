import 'package:get/get.dart';

import '../controllers/visual_controller.dart';

class VisualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisualController>(
      () => VisualController(),
    );
  }
}
