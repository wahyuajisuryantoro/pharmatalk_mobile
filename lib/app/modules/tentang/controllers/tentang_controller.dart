import 'package:bahasaku/app/routes/app_pages.dart';
import 'package:bahasaku/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TentangController extends GetxController {
  final contributors = [
    {
      'photo': 'assets/images/contributor1.png',
      'name': 'John Doe',
      'profession': 'Pharmacist',
      'age': '30',
      'role': 'Content Developer',
    },
    {
      'photo': null, // Fallback ke avatar.png
      'name': 'Jane Smith',
      'profession': 'Linguist',
      'age': '28',
      'role': 'Language Specialist',
    },
    {
      'photo': 'assets/images/contributor2.png',
      'name': 'Emily Davis',
      'profession': 'Software Engineer',
      'age': '32',
      'role': 'App Developer',
    },
    {
      'photo': null, // Fallback ke avatar.png
      'name': 'Michael Brown',
      'profession': 'AR Specialist',
      'age': '35',
      'role': '3D Model Designer',
    },
    {
      'photo': 'assets/images/contributor3.png',
      'name': 'Sarah Lee',
      'profession': 'Graphic Designer',
      'age': '27',
      'role': 'UI/UX Designer',
    },
  ];

  void confirmLogout(BuildContext context) {
    Get.defaultDialog(
      title: 'Logout Confirmation',
      content: Text('Are you sure you want to logout?', style: AppText.mediumTextMedium(),),
      textCancel: 'Cancel',
      textConfirm: 'Logout',
      confirmTextColor: Colors.white,
      onConfirm: logoutUser,
    );
  }

  void logoutUser() {
    GetStorage().erase();
    Get.offAllNamed(Routes.LOGIN);
  }
}
