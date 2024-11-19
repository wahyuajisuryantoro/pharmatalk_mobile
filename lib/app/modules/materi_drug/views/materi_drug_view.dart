import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/materi_drug_controller.dart';

class MateriDrugView extends GetView<MateriDrugController> {
  const MateriDrugView({super.key});

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
              controller.backToMateri();
            },
          )),
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
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              8), 
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: ClipRRect(
                          
                          borderRadius:
                              BorderRadius.circular(8), 
                          child: Image.asset(
                            controller
                                .materiImages[controller.currentIndex.value],
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
