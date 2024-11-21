import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bahasaku/utils/app_colors.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.skyBlue,
      body: Center(
        child: ScaleTransition(
          scale: controller.animation,
          child: Image.asset(
            'assets/images/logo_banner.png',
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
