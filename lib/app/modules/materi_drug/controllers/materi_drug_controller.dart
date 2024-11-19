import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:get/get.dart';

class MateriDrugController extends GetxController {
  final currentIndex = 0.obs;

  final List<String> materiImages = [
    'assets/images/materi_a.jpeg',
    'assets/images/materi_b.jpeg',
    'assets/images/materi_c.jpeg',
    'assets/images/materi_d.jpeg',
  ];

  void nextPage() {
    if (currentIndex.value < materiImages.length - 1) {
      currentIndex.value++;
    }
  }

  void previousPage() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  void backToMateri(){
    Get.toNamed(Routes.MATERI);
  }
}
