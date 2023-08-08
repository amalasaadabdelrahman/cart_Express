import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class UserPrefererencesController {
  static final UserPrefererencesController _instance =
      UserPrefererencesController._internal();
  late SharedPreferences _sharedPreferences;
  factory UserPrefererencesController() {
    return _instance;
  }

  UserPrefererencesController._internal();
  Future<void> initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUser({required User user}) async {
    _sharedPreferences.setString('name', user.name ?? '');
    _sharedPreferences.setString('email', user.email ?? '');
    _sharedPreferences.setString('mobile', user.mobile ?? '');
    _sharedPreferences.setString('image_profile', user.imageProfile ?? '');
    _sharedPreferences.setString('status', user.status ?? 'NotActive');
    _sharedPreferences.setString(
        'access_token', "Bearer${user.accessToken ?? ''}");
  }

  String get loggedIn => _sharedPreferences.getString('status') ?? 'NotActive';
  String get token => _sharedPreferences.getString('access_token') ?? '';

  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }
}
