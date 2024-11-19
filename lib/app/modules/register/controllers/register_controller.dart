import 'dart:convert';
import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final currentPage = 0.obs;
  final pageController = PageController();

  final age = ''.obs;
  final name = ''.obs;
  final username = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  final isPasswordVisible = true.obs;
  final isRegistering = false.obs;


  final ageController = TextEditingController();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void nextPage() {
    if (currentPage.value < 5) {
      bool canProceed = true;
      String errorMessage = '';

      switch (currentPage.value) {
        case 0:
          canProceed = true;
          break;
        case 1:
          if (ageController.text.isEmpty) {
            errorMessage = 'Please enter your age';
            canProceed = false;
          } else if (int.tryParse(ageController.text) == null) {
            errorMessage = 'Please enter a valid age';
            canProceed = false;
          }
          break;
        case 2:
          if (nameController.text.isEmpty) {
            errorMessage = 'Please enter your name';
            canProceed = false;
          }
          break;
        case 3:
          if (usernameController.text.isEmpty) {
            errorMessage = 'Please enter a username';
            canProceed = false;
          }
          break;
        case 4:
          if (emailController.text.isEmpty) {
            errorMessage = 'Please enter your email';
            canProceed = false;
          } else if (!GetUtils.isEmail(emailController.text)) {
            errorMessage = 'Please enter a valid email';
            canProceed = false;
          }
          break;
        case 5:
          if (passwordController.text.isEmpty) {
            errorMessage = 'Please enter a password';
            canProceed = false;
          } else if (passwordController.text.length < 6) {
            errorMessage = 'Password must be at least 6 characters';
            canProceed = false;
          }
          break;
      }

      if (canProceed) {
        currentPage.value++;

        if (currentPage.value == 1) {
          Future.delayed(const Duration(milliseconds: 300), () {
            FocusManager.instance.primaryFocus?.unfocus();
            Future.delayed(const Duration(milliseconds: 100), () {
              FocusScope.of(Get.context!).requestFocus(FocusNode());
              ageController.selection = TextSelection.fromPosition(
                TextPosition(offset: ageController.text.length),
              );
            });
          });
        }
      } else if (errorMessage.isNotEmpty) {
        Get.snackbar(
          'Error',
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
          duration: const Duration(seconds: 2),
        );
      }
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;

      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  


  Future<void> registerUser() async {
  const String url = "https://pharmatalk.com.presensimu.com/api/register";
  
  try {
    isRegistering.value = true;
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': nameController.text,
        'username': usernameController.text,
        'age': int.tryParse(ageController.text),
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );
    isRegistering.value = false;

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      Get.snackbar(
        'Success',
        'Registration successful!',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
      Get.offAllNamed(Routes.LOGIN);
    } else {
      final errorData = jsonDecode(response.body);
      Get.snackbar(
        'Error',
        errorData['errors'].toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  } catch (e) {
    isRegistering.value = false;
    Get.snackbar(
      'Error',
      'Failed to connect to the server',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.1),
      colorText: Colors.red,
    );
  }
}


  @override
  void onClose() {
    pageController.dispose();
    ageController.dispose();
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
