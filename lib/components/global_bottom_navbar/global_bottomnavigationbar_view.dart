import 'package:bahasaku/components/global_bottom_navbar/global_bottomnavigationbar_controller.dart';
import 'package:bahasaku/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavigationBarView extends StatelessWidget {
  BottomNavigationBarView({super.key});

  final BottomNavigationBarController controller =
      Get.put(BottomNavigationBarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onTabTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.skyBlue,
        unselectedItemColor: AppColors.charcoal,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/book-nav.svg',
              colorFilter: ColorFilter.mode(
                controller.selectedIndex.value == 0
                    ? AppColors.skyBlue
                    : AppColors.charcoal,
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/scope-nav.svg',
              colorFilter: ColorFilter.mode(
                controller.selectedIndex.value == 1
                    ? AppColors.skyBlue
                    : AppColors.charcoal,
                BlendMode.srcIn,
              ),
            ),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ar.svg',
              colorFilter: ColorFilter.mode(
                controller.selectedIndex.value == 2
                    ? AppColors.skyBlue
                    : AppColors.charcoal,
                BlendMode.srcIn,
              ),
            ),
            label: 'AR Visual',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user-nav.svg',
              colorFilter: ColorFilter.mode(
                controller.selectedIndex.value == 3
                    ? AppColors.skyBlue
                    : AppColors.charcoal,
                BlendMode.srcIn,
              ),
            ),
            label: 'About',
          ),
        ],
      );
    });
  }
}
