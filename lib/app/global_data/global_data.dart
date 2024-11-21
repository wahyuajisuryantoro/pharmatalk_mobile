import 'package:get_storage/get_storage.dart';

class GlobalData {
  static final storage = GetStorage();

  static Map<String, dynamic>? getUserData() {
    return storage.read('user_data');
  }

  static String? getToken() {
    return storage.read('token');
  }

  static void clearData() {
    storage.erase();
  }
}
