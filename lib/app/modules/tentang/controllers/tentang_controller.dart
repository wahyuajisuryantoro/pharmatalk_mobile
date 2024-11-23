import 'package:bahasaku/app/global_data/global_data.dart';
import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TentangController extends GetxController {
  final contributors = [
    {
      'photo': 'assets/images/athia.png',
      'name': 'Athia Fidian, M. Pd',
      'profession': 'Dosen D3 Farmasi',
      'role': 'Ketua',
    },
    {
      'photo': 'assets/images/ari.png',
      'name': 'R. Arri Widyanto, S.Kom.,MT',
      'profession': 'Dosen D3 Teknologi Informasi',
      'role': 'Anggota',
    },
    {
      'photo': 'assets/images/rofi.png',
      'name': 'Rofi Abul Hasani, S.Kom., M.Eng',
      'profession': 'Dosen S1 Teknik Informatika',
      'role': 'Anggota',
    },
    {
      'photo': 'assets/images/ajik.png',
      'name': 'Wahyu Aji Suryantoro, S.Kom',
      'profession': 'Programmer/Fullstack Developer',
      'role': 'Anggota',
    },
  ];

  // Konfirmasi logout
  void confirmLogout(BuildContext context) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.warning_rounded,
              color: AppColors.goldenYellow,
              size: 60.0,
            ),
            const SizedBox(height: 20),
            Text(
              'Logout Confirmation',
              style: AppText.extraLargeTextBold(color: AppColors.charcoal),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Are you sure you want to logout?',
              style: AppText.mediumTextRegular(color: AppColors.darkGrey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: AppText.mediumTextMedium(color: AppColors.charcoal),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: logoutUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.crimson,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      'Logout',
                      style: AppText.mediumTextMedium(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

  // Fungsi logout
  void logoutUser() {
    GlobalData.clearData(); // Gunakan GlobalData untuk menghapus data
    Get.offAllNamed(Routes.LOGIN); // Navigasi ke halaman login
  }
}
