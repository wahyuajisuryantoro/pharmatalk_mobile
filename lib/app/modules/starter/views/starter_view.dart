import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/starter_controller.dart';

class StarterView extends GetView<StarterController> {
  const StarterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(height: AppResponsive.height(context, 10)),
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: AppResponsive.width(context, 75),
              height: AppResponsive.height(context, 40),
            ),
          ),
          SizedBox(height: AppResponsive.height(context, 5)),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.skyBlue,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppResponsive.width(context, 8),
                  vertical: AppResponsive.height(context, 4),
                ),
                child: Column(
                  children: [
                    // Hapus Obx di sini
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        height: AppResponsive.height(context, 15),
                        viewportFraction: 1.0,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          controller.onPageChanged(index, reason);
                        },
                      ),
                      items: controller.slides.map((slide) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              slide['title']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: AppResponsive.width(context, 6),
                              ),
                            ),
                            SizedBox(
                                height: AppResponsive.height(context, 2)),
                            Text(
                              slide['subtitle']!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.paleBlue,
                                fontSize: AppResponsive.width(context, 4),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),

                    // Carousel indicators
                    Obx(() {
                      final currentIndex = controller.carouselIndex.value;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.slides.length,
                          (index) => Container(
                            width: 12,
                            height: 12,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? AppColors.goldenYellow
                                  : AppColors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      );
                    }),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: controller.onRegisterPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.skyBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: AppColors.white),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: AppResponsive.height(context, 2),
                              ),
                            ),
                            child: Text("Register",
                                style: AppText.extraLargeTextRegular(
                                    color: AppColors.white)),
                          ),
                        ),
                        SizedBox(width: AppResponsive.width(context, 4)),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: controller.onLoginPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: AppResponsive.height(context, 2),
                              ),
                            ),
                            child: Text("Login",
                                style: AppText.extraLargeTextRegular(
                                    color: AppColors.skyBlue)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppResponsive.height(context, 4)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
