import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pengucapan_gambar_controller.dart';

class PengucapanGambarView extends GetView<PengucapanGambarController> {
  const PengucapanGambarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skyBlue,
        title: const Text(
          'Materi',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
          onPressed: () {
            controller.backToPengucapan();
          },
        ),
      ),
      body: Obx(() {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (controller.currentIndex.value > 0)
                    GestureDetector(
                      onTap: () => controller.previousPage(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "<< Kembali",
                          style:
                              AppText.smallTextMedium(color: AppColors.white),
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                  if (controller.currentIndex.value <
                      controller.materiImages.length - 1)
                    GestureDetector(
                      onTap: () => controller.nextPage(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Selanjutnya >>",
                          style:
                              AppText.smallTextMedium(color: AppColors.white),
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
            SizedBox(height: AppResponsive.height(context, 3)),
            GestureDetector(
              onTap: () => controller.speak(controller.currentIndex.value),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8), // Padding dalam rectangle
                  decoration: BoxDecoration(
                    color: AppColors.skyBlue, // Background sky blue
                    borderRadius: BorderRadius.circular(8), // Border radius
                    border: Border.all(
                        color: AppColors.skyBlue), // Border warna sky blue
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Menjaga ukuran rectangle sesuai konten
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${controller.currentIndex.value + 1}. ${controller.titles[controller.currentIndex.value]}",
                        style: AppText.mediumTextBold(
                            color: Colors.white), // Teks putih
                      ),
                      const SizedBox(width: 8),
                      Obx(() => controller.isLoading.value
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white, // Loading spinner putih
                              ),
                            )
                          : const Icon(
                              Icons.volume_up,
                              color: Colors.white, // Ikon putih
                            )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: AppResponsive.height(context, 2)),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            controller.materiImages[controller.currentIndex.value],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
