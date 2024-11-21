import 'package:get/get.dart';

import '../controllers/materi_ar_controller.dart';

class MateriArBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MateriArController>(
      () => MateriArController(),
    );
  }
}
