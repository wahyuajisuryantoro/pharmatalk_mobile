import 'package:bahasaku/app/global_data/global_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Variabel untuk menyimpan nama pengguna
  final userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Ambil data pengguna dari GlobalData
    final userData = GlobalData.getUserData();
    userName.value = userData?['name'] ?? 'Guest'; // Default ke 'Guest' jika null
  }
}
