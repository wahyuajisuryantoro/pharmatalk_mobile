import 'package:get/get.dart';

import '../controllers/pengucapan_gambar_controller.dart';

class PengucapanGambarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengucapanGambarController>(
      () => PengucapanGambarController(),
    );
  }
}
