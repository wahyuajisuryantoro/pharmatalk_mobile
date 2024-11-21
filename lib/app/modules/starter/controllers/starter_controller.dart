import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarterController extends GetxController {
  final CarouselController carouselController = CarouselController();
  final RxInt carouselIndex = 0.obs;

  final List<Map<String, String>> slides = [
    {
      "title": "Learn Pharmacy English!",
      "subtitle": "Interactive lessons to improve your skills.",
    },
    {
      "title": "Engage with Real Scenarios",
      "subtitle": "Learn phrases used in real-life pharmacy situations.",
    },
    {
      "title": "Free and Easy to Use",
      "subtitle": "Get started and learn at your own pace!",
    },
  ];

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    carouselIndex.value = index;
  }

  void onRegisterPressed() {
    Get.toNamed(Routes.REGISTER);
  }

  void onLoginPressed() {
   Get.toNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
