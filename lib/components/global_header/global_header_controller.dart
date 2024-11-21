import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GlobalHeaderController extends GetxController {
  
  final userName = ''.obs;

  @override
  void onInit() {
    super.onInit(); 
    final userData = GetStorage().read<Map<String, dynamic>>('user_data');
    userName.value = userData?['name'] ?? 'Guest'; 
  }
}
