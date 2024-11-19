import 'package:get/get.dart';

import '../controllers/materi_drug_controller.dart';

class MateriDrugBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MateriDrugController>(
      () => MateriDrugController(),
    );
  }
}
