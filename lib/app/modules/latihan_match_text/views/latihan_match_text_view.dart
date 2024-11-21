import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/latihan_match_text_controller.dart';

class LatihanMatchTextView extends GetView<LatihanMatchTextController> {
  const LatihanMatchTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materi', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.skyBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () {
            controller.backToLatihan();
          },
        ),
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.leftItems.length,
                          itemBuilder: (context, index) {
                            final item = controller.leftItems[index];
                            return Obx(() {
                              final isSelected =
                                  controller.selectedLeft.value == item;
                              return GestureDetector(
                                onTap: () => controller.selectLeft(item),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.blueDark
                                        : AppColors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      item,
                                      style: AppText.mediumTextRegular(
                                        color: isSelected
                                            ? AppColors.white
                                            : AppColors.charcoal,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.rightItems.length,
                          itemBuilder: (context, index) {
                            final item = controller.rightItems[index];
                            return Obx(() {
                              final isSelected =
                                  controller.selectedRight.value == item;
                              return GestureDetector(
                                onTap: () => controller.selectRight(item),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.pastelYellow
                                        : AppColors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      item,
                                      style: AppText.mediumTextRegular(
                                        color: isSelected
                                            ? AppColors.white
                                            : AppColors.charcoal,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.isGameComplete.value)
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        Text(
                          'Permainan Selesai',
                          style: AppText.heading3(color: AppColors.forestGreen),
                        ),
                        Text(
                          'Skor: ${controller.score.value}',
                          style: AppText.heading4(color: AppColors.charcoal),
                        ),
                        Text(
                          'Grade: ${controller.grade.value}',
                          style: AppText.heading4(color: AppColors.charcoal),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: controller.resetGame,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.freshGreen,
                            padding: EdgeInsets.symmetric(
                                horizontal: 32, vertical: 16),
                          ),
                          child: Text(
                            'Main Lagi',
                            style:
                                AppText.largeTextMedium(color: AppColors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          )),
    );
  }
}
