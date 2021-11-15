import 'package:shared_preferences/shared_preferences.dart';

storeUserData(apiResponse) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  await storage.setString('authtoken', apiResponse['token']);
}

Future<String?> getToken() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String? token = storage.getString('authtoken');
  return token;
}

const apiUrl = 'https://app.mikumifreight.com';
