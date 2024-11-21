import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:bahasaku/components/global_bottom_navbar/global_bottomnavigationbar_view.dart';
import 'package:bahasaku/components/global_header/global_header_view.dart';
import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/visual_controller.dart';

class VisualView extends GetView<VisualController> {
  const VisualView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalHeader(),
          SizedBox(height: AppResponsive.height(context, 4)),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.MATERI_AR);
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: AppResponsive.width(context, 5),
              ),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.babyBlue,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    height: AppResponsive.height(context, 6),
                    width: AppResponsive.height(context, 6),
                    decoration: BoxDecoration(
                      color: AppColors.blueDark,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/ar.svg',
                        height: AppResponsive.height(context, 3),
                        width: AppResponsive.height(context, 3),
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: AppResponsive.width(context, 4)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Augmented Reality',
                        style: AppText.largeTextMedium(
                          color: AppColors.charcoal,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Menampilkan visual secara AR',
                        style: AppText.mediumTextRegular(
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarView(),
    );
  }
}
