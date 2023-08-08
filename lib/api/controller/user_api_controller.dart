import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/user.dart';
import '../../prefs/user_preferences_controller.dart';
import '../api_settings.dart';

class UserApiController {
  Future<bool> login({required String email, required String password}) async {
    var url = Uri.parse(ApiSetting.LOGIN);
    var response = await http.post(
      url,
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      User user = User.fromJson(jsonObject['user']);
      UserPrefererencesController().saveUser(user: user);
      return true;
    } else if (response.statusCode == 400) {
    } else {}
    return false;
  }
}
