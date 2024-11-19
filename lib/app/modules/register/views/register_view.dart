import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:bahasaku/utils/app_colors.dart';
import 'package:bahasaku/utils/app_responsive.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Obx(() {
          if (controller.currentPage.value > 0) {
            return Container(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, top: 8, bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: controller.previousPage,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 2),
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black54,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Container(height: 0);
        }),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: controller.currentPage.value == 0
                ? OnboardingContent(
                    onNext: () {
                      controller.nextPage();
                    },
                    onBack: () {
                      Get.offAllNamed(Routes.LOGIN);
                    },
                  )
                : FormContent(
                    title: getTitle(controller.currentPage.value),
                    hintText: getHintText(controller.currentPage.value),
                    controller: controller,
                    onNext: () async {
                      if (controller.currentPage.value == 5) {
                        await controller.registerUser();
                      } else {
                        controller.nextPage();
                      }
                    },
                    onBack: controller.previousPage,
                    keyboardType: getKeyboardType(controller.currentPage.value),
                    obscureText: controller.currentPage.value == 5,
                  ),
          ),
        ),
      ),
    );
  }

  String getTitle(int page) {
    switch (page) {
      case 1:
        return "How old are you?";
      case 2:
        return "What is your name?";
      case 3:
        return "Choose a username";
      case 4:
        return "What is your email?";
      case 5:
        return "Set a password";
      default:
        return "Create Your Profile Now!";
    }
  }

  String getHintText(int page) {
    switch (page) {
      case 1:
        return "Enter your age";
      case 2:
        return "Enter your name";
      case 3:
        return "Enter your username";
      case 4:
        return "Enter your email";
      case 5:
        return "Enter your password";
      default:
        return "";
    }
  }

  TextInputType getKeyboardType(int page) {
    switch (page) {
      case 1:
        return TextInputType.number;
      case 2:
        return TextInputType.name;
      case 3:
        return TextInputType.text;
      case 4:
        return TextInputType.emailAddress;
      case 5:
        return TextInputType.visiblePassword;
      default:
        return TextInputType.text;
    }
  }
}

class OnboardingContent extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const OnboardingContent({
    Key? key,
    required this.onNext,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CurvedBottomClipper(),
              child: Container(
                width: double.infinity,
                height: AppResponsive.height(context, 70),
                color: AppColors.skyBlue,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 2),
                  Center(
                    child: SizedBox(
                      height: AppResponsive.height(context, 30),
                      child: SvgPicture.asset(
                        'assets/images/onboarding_image.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Your Profile',
                        style: AppText.heading2(color: AppColors.charcoal),
                      ),
                      Text(
                        'Now!',
                        style: AppText.heading1(color: AppColors.charcoal)
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: AppResponsive.height(context, 2)),
                      Text(
                        'Create a profile to save your learning progress and keep learning for free!',
                        style: AppText.mediumTextRegular(color: AppColors.grey),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: AppResponsive.height(context, 8)),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: onBack,
                          child: Text(
                            'Back',
                            style: AppText.extraLargeTextMedium(
                                color: AppColors.skyBlue),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: onNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.skyBlue,
                            minimumSize: const Size(100, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Next',
                            style: AppText.extraLargeTextMedium(
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.85);

    final firstControlPoint = Offset(size.width / 4, size.height);
    final firstEndPoint = Offset(size.width / 2, size.height * 0.85);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final secondControlPoint = Offset(size.width * 3 / 4, size.height * 0.7);
    final secondEndPoint = Offset(size.width, size.height * 0.85);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class FormContent extends StatelessWidget {
  final String title;
  final String hintText;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final TextInputType keyboardType;
  final bool obscureText;
  final RegisterController controller;

  const FormContent({
    Key? key,
    required this.title,
    required this.hintText,
    required this.onNext,
    required this.onBack,
    required this.keyboardType,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double fieldWidth = AppResponsive.width(context, 80);

    final TextEditingController textController;
    switch (controller.currentPage.value) {
      case 1:
        textController = controller.ageController;
        break;
      case 2:
        textController = controller.nameController;
        break;
      case 3:
        textController = controller.usernameController;
        break;
      case 4:
        textController = controller.emailController;
        break;
      case 5:
        textController = controller.passwordController;
        break;
      default:
        textController = TextEditingController();
    }

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppResponsive.width(context, 8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppResponsive.height(context, 18)),
          Text(
            title,
            style: AppText.heading2(color: AppColors.charcoal),
          ),
          SizedBox(height: AppResponsive.height(context, 2)),
          SizedBox(
            width: fieldWidth,
            child: TextField(
              controller: textController,
              keyboardType: keyboardType,
              textAlign: TextAlign.center,
              obscureText:
                  obscureText ? controller.isPasswordVisible.value : false,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppText.mediumTextRegular(
                  color: AppColors.grey,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.skyBlue,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.skyBlue,
                    width: 2,
                  ),
                ),
                suffixIcon: obscureText
                    ? Obx(() => IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.skyBlue,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ))
                    : null,
              ),
              style: AppText.mediumTextRegular(
                color: AppColors.charcoal,
              ),
            ),
          ),
          SizedBox(height: AppResponsive.height(context, 3)),
          SizedBox(
            width: fieldWidth,
            child: Obx(() => ElevatedButton(
                  onPressed: controller.isRegistering.value
                      ? null // Tombol dinonaktifkan saat proses berlangsung
                      : onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.skyBlue,
                    padding: EdgeInsets.symmetric(
                      vertical: AppResponsive.height(context, 2),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: controller.isRegistering.value
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(
                          controller.currentPage.value == 5
                              ? "Register Now"
                              : "Next",
                          style:
                              AppText.extraLargeTextMedium(color: Colors.white),
                        ),
                )),
          ),
        ],
      ),
    );
  }
}
