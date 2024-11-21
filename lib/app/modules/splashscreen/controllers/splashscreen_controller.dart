import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bahasaku/app/routes/app_pages.dart';

class SplashscreenController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    animationController.forward();

    // Navigasi ke halaman berikutnya setelah beberapa detik
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offAllNamed(Routes.STARTER); // Ganti dengan route tujuan Anda
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
