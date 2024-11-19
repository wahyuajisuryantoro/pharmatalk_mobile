import 'package:get/get.dart';

import '../controllers/pengucapan_penjelasan_controller.dart';

class PengucapanPenjelasanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengucapanPenjelasanController>(
      () => PengucapanPenjelasanController(),
      fenix: true, 
    );
  }
}
