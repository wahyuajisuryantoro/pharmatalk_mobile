import 'package:get_storage/get_storage.dart';

class GlobalData {
  static final storage = GetStorage();

  // Mendapatkan data user
  static Map<String, dynamic>? getUserData() {
    return storage.read('user_data');
  }

  // Mendapatkan token
  static String? getToken() {
    return storage.read('token');
  }

  // Menyimpan data user
  static void saveUserData(Map<String, dynamic> userData, String token) {
    storage.write('user_data', userData);
    storage.write('token', token);
  }

  // Menghapus data user
  static void clearData() {
    storage.erase();
  }
}
