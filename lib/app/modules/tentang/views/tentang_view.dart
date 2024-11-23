import 'package:bahasaku/components/global_bottom_navbar/global_bottomnavigationbar_view.dart';
import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tentang_controller.dart';

class TentangView extends GetView<TentangController> {
  const TentangView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'About Us',
          style: AppText.heading4(color: AppColors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.skyBlue,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppResponsive.width(context, 8),
          vertical: AppResponsive.height(context, 4),
        ),
        child: ListView(
          children: [
            // Tentang PharmaTalk
            Text(
              'About PharmaTalk',
              style: AppText.heading2(color: AppColors.charcoal),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppResponsive.height(context, 2)),
            Text(
              'PharmaTalk is an application designed for English learning with a focus on pharmacy themes. It features text-to-speech for listening to English phrases in pharmacy contexts, AR 3D object views for laboratory equipment, and educational games.',
              style: AppText.largeTextRegular(color: AppColors.charcoal),
              textAlign: TextAlign.justify, // Justify text
            ),
            SizedBox(height: AppResponsive.height(context, 4)),

            // Contributor Section
            Text(
              'Team Pharmatalk',
              style: AppText.heading2(color: AppColors.charcoal),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppResponsive.height(context, 2)),
            ..._buildContributorCards(context),

            // Logo UNIMMA
            SizedBox(height: AppResponsive.height(context, 4)),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Supported By:',
                    style: AppText.largeTextMedium(color: AppColors.charcoal),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppResponsive.height(context, 2)),
                  Image.asset(
                    'assets/images/logo_kampus.png',
                    width: AppResponsive.width(context, 50),
                    height: AppResponsive.height(context, 10),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'Universitas Muhammadiyah Magelang',
                    style: AppText.largeTextMedium(color: AppColors.charcoal),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Logout Button
            SizedBox(height: AppResponsive.height(context, 4)),
            ElevatedButton(
              onPressed: () => controller.confirmLogout(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.crimson,
                padding: EdgeInsets.symmetric(
                  vertical: AppResponsive.height(context, 2),
                  horizontal: AppResponsive.width(context, 6),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Logout',
                style: AppText.largeTextMedium(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarView(),
    );
  }

  List<Widget> _buildContributorCards(BuildContext context) {
    return controller.contributors.map((contributor) {
      return Padding(
        padding:
            EdgeInsets.symmetric(vertical: AppResponsive.height(context, 2)),
        child: Card(
          color: AppColors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppResponsive.width(context, 4)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: AppResponsive.width(context, 8),
                  backgroundImage: AssetImage(
                    contributor['photo'] ?? 'assets/images/avatar.png',
                  ),
                ),
                SizedBox(width: AppResponsive.width(context, 4)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contributor['name']!,
                        style:
                            AppText.largeTextMedium(color: AppColors.charcoal),
                      ),
                      SizedBox(height: AppResponsive.height(context, 0.5)),
                      Text(
                        contributor['profession']!,
                        style: AppText.mediumTextRegular(color: AppColors.grey),
                      ),
                      SizedBox(height: AppResponsive.height(context, 1)),
                      Text(
                        contributor['role']!,
                        style:
                            AppText.mediumTextMedium(color: AppColors.skyBlue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}
