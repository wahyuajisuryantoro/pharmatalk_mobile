import 'package:bahasaku/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final LoginController loginController = Get.put(LoginController());
  final bool isLoggedIn = loginController.isLoggedIn();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? Routes.HOME : AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
