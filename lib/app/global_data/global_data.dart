import 'package:get_storage/get_storage.dart';

class GlobalData {
  static final storage = GetStorage();

  static Map<String, dynamic>? getUserData() {
    return storage.read('user_data');
  }

  static String? getToken() {
    return storage.read('token');
  }

  static void saveUserData(Map<String, dynamic> userData, String token) {
    storage.write('user_data', userData);
    storage.write('token', token);
  }

  static void clearData() {
    storage.erase();
  }

static void clearLoginData() {
  print('Clearing login data...');
  storage.remove('token');
  storage.remove('user_data');
  print('Token removed: ${storage.read('token')}');
  print('User data removed: ${storage.read('user_data')}');
}

}
