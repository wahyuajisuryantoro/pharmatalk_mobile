import 'dart:convert';
import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isPasswordHidden = true.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessageUsername = ''.obs;
  final RxString errorMessagePassword = ''.obs;
  final GetStorage storage = GetStorage();

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> loginUser() async {
    validateInputs();
    if (errorMessageUsername.isEmpty && errorMessagePassword.isEmpty) {
      isLoading.value = true;
      try {
        const String url = "https://pharmatalk.com.presensimu.com/api/login";
        final response = await http.post(
          Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': usernameController.text.trim(),
            'password': passwordController.text,
          }),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final userData = responseData['user'];

          // Simpan data user di GetStorage
          storage.write('user_data', userData);
          storage.write('token', responseData['access_token']);

          // Pindah ke halaman HOME
          Get.offAllNamed(Routes.HOME);
        } else if (response.statusCode == 401) {
          errorMessagePassword.value = 'Incorrect password.';
        } else if (response.statusCode == 404) {
          errorMessageUsername.value = 'Username not found.';
        } else {
          Get.snackbar(
            'Error',
            'An unexpected error occurred. Please try again later.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.1),
            colorText: Colors.red,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'Unable to connect to the server. Please check your internet connection.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.1),
          colorText: Colors.red,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  void validateInputs() {
    errorMessageUsername.value = '';
    errorMessagePassword.value = '';
    if (usernameController.text.isEmpty) {
      errorMessageUsername.value = 'Username is required';
    }
    if (passwordController.text.isEmpty) {
      errorMessagePassword.value = 'Password is required';
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  bool isLoggedIn() {
    return storage.hasData('token') && storage.hasData('user_data');
  }

  void redirectIfLoggedIn() {
    if (isLoggedIn()) {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
