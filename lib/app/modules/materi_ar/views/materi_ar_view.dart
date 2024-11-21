import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:collection/collection.dart';

import '../controllers/materi_ar_controller.dart';

class MateriArView extends GetView<MateriArController> {
  const MateriArView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Laboratory Equipment 3D Models',
          style: AppText.heading4(color: AppColors.white),
        ),
        backgroundColor: AppColors.skyBlue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: AppResponsive.height(context, 2)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppResponsive.width(context, 5)),
            child: Obx(() {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.models.map((model) {
                    final isSelected =
                        controller.selectedModel.value == model['name'];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppResponsive.width(context, 1)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? AppColors.blueDark
                              : AppColors.skyBlue,
                          padding: EdgeInsets.symmetric(
                            vertical: AppResponsive.height(context, 2),
                            horizontal: AppResponsive.width(context, 2),
                          ),
                        ),
                        onPressed: () {
                          controller.selectModel(model['name']!);
                        },
                        child: Text(
                          model['label']!,
                          style: AppText.mediumTextMedium(
                              color: AppColors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
          ),
          SizedBox(height: AppResponsive.height(context, 2)),
          Expanded(
            child: Obx(() {
              var selectedModelName = controller.selectedModel.value;
              var modelData = controller.models
                  .firstWhereOrNull((model) => model['name'] == selectedModelName);

              if (modelData != null) {
                return Column(
                  children: [
                    Expanded(
                      child: ModelViewer(
                        key: ValueKey(selectedModelName), 
                        src: modelData['asset']!,
                        alt: modelData['explanation']!,
                        autoRotate: true,
                        ar: true,
                        arModes: const ['scene-viewer', 'webxr', 'quick-look'],
                        cameraControls: true,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.all(AppResponsive.width(context, 2)),
                      child: Text(
                        modelData['explanation']!,
                        style: AppText.largeTextRegular(
                            color: AppColors.charcoal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    'Select a model to display',
                    style: AppText.largeTextRegular(color: AppColors.charcoal),
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
