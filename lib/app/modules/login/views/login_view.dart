import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: AppResponsive.height(context, 35),
                width: AppResponsive.width(context, 100),
              ),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: AppText.mediumTextMedium(color: AppColors.skyBlue),
                    ),
                    SizedBox(
                      height: AppResponsive.height(context, 0.8),
                    ),
                    TextField(
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your username',
                        hintStyle: AppText.mediumTextRegular(
                            color: AppColors.charcoal),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: controller.errorMessageUsername.isNotEmpty
                                ? AppColors.crimson
                                : AppColors.lightGrey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: controller.errorMessageUsername.isNotEmpty
                                ? AppColors.crimson
                                : AppColors.skyBlue,
                            width: 2,
                          ),
                        ),
                      ),
                      style:
                          AppText.mediumTextRegular(color: AppColors.charcoal),
                    ),
                    if (controller.errorMessageUsername.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          controller.errorMessageUsername.value,
                          style: AppText.smallTextRegular(
                              color: AppColors.crimson),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: AppResponsive.height(context, 2)),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: AppText.mediumTextMedium(color: AppColors.skyBlue),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: controller.passwordController,
                      obscureText: controller.isPasswordHidden.value,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: AppText.mediumTextRegular(
                            color: AppColors.charcoal),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: controller.errorMessagePassword.isNotEmpty
                                ? AppColors.crimson
                                : AppColors.lightGrey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: controller.errorMessagePassword.isNotEmpty
                                ? AppColors.crimson
                                : AppColors.skyBlue,
                            width: 2,
                          ),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: controller.togglePasswordVisibility,
                          child: SvgPicture.asset(
                            controller.isPasswordHidden.value
                                ? 'assets/icons/eye.svg'
                                : 'assets/icons/eye.svg',
                            color: AppColors.grey,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      style:
                          AppText.mediumTextRegular(color: AppColors.charcoal),
                    ),
                    if (controller.errorMessagePassword.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          controller.errorMessagePassword.value,
                          style: AppText.smallTextRegular(
                              color: AppColors.crimson),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: AppResponsive.height(context, 4)),
              ElevatedButton(
                onPressed: () {
                  if (!controller.isLoading.value) {
                    controller.loginUser();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.skyBlue,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Obx(() {
                  return controller.isLoading.value
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(AppColors.white),
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'Login',
                          style:
                              AppText.largeTextRegular(color: AppColors.white),
                        );
                }),
              ),
              SizedBox(height: AppResponsive.height(context, 4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppText.mediumTextRegular(color: AppColors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.REGISTER);
                    },
                    child: Text(
                      'Register',
                      style: AppText.mediumTextMedium(color: AppColors.skyBlue),
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
}
