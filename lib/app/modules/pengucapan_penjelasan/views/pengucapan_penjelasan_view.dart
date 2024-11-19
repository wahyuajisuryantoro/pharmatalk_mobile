import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pengucapan_penjelasan_controller.dart';

class PengucapanPenjelasanView extends GetView<PengucapanPenjelasanController> {
  const PengucapanPenjelasanView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.reactivatePage(); 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.skyBlue,
        title: Text(
          'Pengucapan',
          style: AppText.largeTextBold(color: AppColors.white),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
          ),
          onPressed: () => controller.backToPengucapan(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                final item = controller.data[index];
                return Obx(() {
                  final isCurrentlyPlaying = controller.currentlyPlayingIndex.value == index;
                  final isPlaying = isCurrentlyPlaying && controller.isPlaying.value;

                  return Card(
                    color: AppColors.grey,
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => controller.toggleSpeaking(index),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: isCurrentlyPlaying 
                                        ? AppColors.skyBlue 
                                        : AppColors.blueDark,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    isPlaying 
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title']!,
                                      style: AppText.mediumTextBold(
                                        color: AppColors.charcoal,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item['explanation']!,
                                      style: AppText.smallTextRegular(
                                        color: AppColors.charcoal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (isCurrentlyPlaying) ...[
                            const SizedBox(height: 12),
                            LinearProgressIndicator(
                              value: controller.currentProgress.value,
                              backgroundColor: AppColors.grey.withOpacity(0.3),
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.skyBlue,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Playback Speed',
                  style: AppText.mediumTextBold(color: AppColors.charcoal),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        if (controller.speechRate.value > 0.1) {
                          controller.setSpeechRate(
                            (controller.speechRate.value - 0.1).clamp(0.1, 1.0),
                          );
                        }
                      },
                    ),
                    Expanded(
                      child: Obx(() {
                        return Slider(
                          value: controller.speechRate.value,
                          min: 0.1,
                          max: 1.0,
                          divisions: 9,
                          label: '${(controller.speechRate.value).toStringAsFixed(1)}x',
                          onChanged: controller.setSpeechRate,
                        );
                      }),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        if (controller.speechRate.value < 1.0) {
                          controller.setSpeechRate(
                            (controller.speechRate.value + 0.1).clamp(0.1, 1.0),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}