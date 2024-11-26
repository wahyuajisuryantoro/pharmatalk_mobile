import 'package:get/get.dart';

import '../controllers/visual_video_controller.dart';

class VisualVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisualVideoController>(
      () => VisualVideoController(),
    );
  }
}
