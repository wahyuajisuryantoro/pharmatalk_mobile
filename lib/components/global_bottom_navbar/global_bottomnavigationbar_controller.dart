import 'package:get/get.dart';
import 'package:bahasaku/app/routes/app_pages.dart';

class BottomNavigationBarController extends GetxController {
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    _syncTabWithRoute();
  }

  void onTabTapped(int index) {
    selectedIndex.value = index;

    switch (index) {
      case 0:
        if (Get.currentRoute != Routes.HOME) {
          Get.offAllNamed(Routes.HOME);
        }
        break;
      case 1:
        if (Get.currentRoute != Routes.LATIHAN) {
          Get.offAllNamed(Routes.LATIHAN);
        }
        break;
      case 2:
        if (Get.currentRoute != Routes.VISUAL) {
          Get.offAllNamed(Routes.VISUAL);
        }
        break;
      case 3:
        if (Get.currentRoute != Routes.TENTANG) {
          Get.offAllNamed(Routes.TENTANG);
        }
        break;
    }
  }

  void _syncTabWithRoute() {
    switch (Get.currentRoute) {
      case Routes.HOME:
        selectedIndex.value = 0;
        break;
      case Routes.LATIHAN:
        selectedIndex.value = 1;
        break;
      case Routes.VISUAL:
        selectedIndex.value = 2;
        break;
      case Routes.TENTANG:
        selectedIndex.value = 3;
        break;
      default:
        selectedIndex.value = 0;
    }
  }
}
