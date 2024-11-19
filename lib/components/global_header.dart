import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';

class GlobalHeader extends StatelessWidget {
  const GlobalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header Section
        Stack(
          children: [
            // Background Decoration
            Container(
              height: AppResponsive.height(context, 20),
              decoration: const BoxDecoration(
                color: AppColors.skyBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),

            // Avatar and Greetings
            Positioned(
              top: AppResponsive.height(context, 7),
              left: AppResponsive.width(context, 7),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: AppResponsive.height(context, 3.5),
                    backgroundColor: AppColors.white,
                    child: Image.asset(
                      'assets/images/avatar.png',
                      height: AppResponsive.height(context, 17),
                      width: AppResponsive.width(context, 17),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: AppResponsive.width(context, 4)),

                  // Greetings and Name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppResponsive.height(context, 1),
                      ),
                      Text(
                        'Assalamualaikum,',
                        style:
                            AppText.mediumTextBold(color: AppColors.white),
                      ),
                      Text(
                        'Rofi Abul Hasani',
                        style: AppText.heading4(
                            color: AppColors.freshGreen),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
