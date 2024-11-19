import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:bahasaku/components/global_header.dart';
import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Data banner
    final List<Map<String, String>> banners = [
      {
        'logo': 'assets/images/logo_banner.png',
        'title': 'Yuk Belajar Bahasa Inggris Tetap Asik..!',
        'image': 'assets/images/news_banner.png',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Header Section
          const GlobalHeader(),

          // Spacing between header and content
          SizedBox(height: AppResponsive.height(context, 3)),

          // Body Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // News Section
                    Text(
                      'News',
                      style: AppText.largeTextBold(color: AppColors.charcoal),
                    ),
                    const SizedBox(height: 8),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: AppResponsive.height(context, 22),
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                      ),
                      items: banners.map((banner) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Stack(
                                children: [
                                  // Background Decoration
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.skyBlue,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),

                                  // Circular Decoration
                                  Positioned(
                                    right: -AppResponsive.width(context, 10),
                                    bottom: -AppResponsive.height(context, 5),
                                    child: Container(
                                      width: AppResponsive.width(context, 35),
                                      height: AppResponsive.height(context, 20),
                                      decoration: BoxDecoration(
                                        color: AppColors.oceanBlue
                                            .withOpacity(0.3),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),

                                  // Content
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        // Logo and Text
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // Logo
                                              Image.asset(
                                                banner['logo']!,
                                                height: AppResponsive.height(
                                                    context, 5),
                                              ),
                                              const SizedBox(height: 8),
                                              // Title with Border and Background
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFCD188),
                                                  border: Border.all(
                                                    color: Color(0xFF263238),
                                                    width: 3,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 4,
                                                  horizontal: 8,
                                                ),
                                                child: Text(
                                                  banner['title']!,
                                                  style:
                                                      AppText.mediumTextMedium(
                                                    color: AppColors.charcoal,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // News Image
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Image.asset(
                                            banner['image']!,
                                            height: AppResponsive.height(
                                                context, 30),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),

                    // Spacing
                    SizedBox(height: AppResponsive.height(context, 3)),

                    // Menu Section
                    Text(
                      'Menu',
                      style: AppText.largeTextBold(color: AppColors.charcoal),
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      children: [
                        _buildMenuButton(
                          context,
                          iconPath: 'assets/icons/book.svg',
                          title: 'Materi',
                          onTap: () {
                            Get.toNamed(Routes.MATERI);
                          },
                        ),
                        _buildMenuButton(
                          context,
                          iconPath: 'assets/icons/visual.svg',
                          title: 'Visual',
                          onTap: () {
                            Get.toNamed(Routes.VISUAL);
                          },
                        ),
                        _buildMenuButton(
                          context,
                          iconPath: 'assets/icons/speech.svg',
                          title: 'Pengucapan',
                          onTap: () {
                            Get.toNamed(Routes.PENGUCAPAN);
                          },
                        ),
                        _buildMenuButton(
                          context,
                          iconPath: 'assets/icons/exercise.svg',
                          title: 'Latihan',
                          onTap: () {
                            // Aksi untuk Latihan
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper untuk tombol menu
  Widget _buildMenuButton(BuildContext context,
      {required String iconPath,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.skyBlue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: AppResponsive.height(context, 6),
              color: AppColors.white,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: AppText.mediumTextMedium(color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
