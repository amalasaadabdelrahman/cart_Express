import 'dart:convert';
import 'dart:io';
import 'package:cart_express/Secreens/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../models/user.dart';
import '../../prefs/user_preferences_controller.dart';
import '../api_settings.dart';

class UserApiController with Helpers {
  Future<bool> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    var url = Uri.parse(ApiSetting.LOGIN);
    var response = await http.post(
      url,
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['message'] == 'password is wrong') {
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    } else if (response.statusCode == 200 &&
        jsonDecode(response.body)['message'] == 'Email not found') {
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    } else if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      User user = User.fromJson(jsonObject['user']);
      UserPrefererencesController().saveUser(user: user);
      return true;
    }
    return false;
  }

  Future<bool> logout() async {
    var url = Uri.parse(ApiSetting.LOGOUT);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: UserPrefererencesController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    print('status code  : ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 401) {
      await UserPrefererencesController().logout();
      return true;
    }
    return false;
  }

  Future<bool> register(
      {required BuildContext context,
      required String email,
      required String password,
      required String name,
      required String mobile}) async {
    var url = Uri.parse(ApiSetting.REGISTER);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
      'mobile': mobile,
      'name': name
    });
    String message = jsonDecode(response.body)['message'];
    if (response.statusCode == 200 &&
        message == "The email has already been taken.") {
    } else if (response.statusCode == 200 &&
        message ==
            "The email has already been taken.\nThe mobile has already been taken.") {
      showSnackBar(context: context, message: message, error: true);
    } else if (response.statusCode == 200 &&
        message == "The mobile has already been taken.") {
      showSnackBar(context: context, message: message, error: true);
    } else if (response.statusCode == 200) {
      return true;
    } else {
      showSnackBar(
          context: context, message: 'Something went wrong', error: true);
    }
    return false;
  }
}
