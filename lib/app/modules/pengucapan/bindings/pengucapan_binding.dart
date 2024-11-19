import 'package:get/get.dart';

import '../controllers/pengucapan_controller.dart';

class PengucapanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengucapanController>(
      () => PengucapanController(),
    );
  }
}
