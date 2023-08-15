import 'dart:convert';

import '../../models/setting.dart';
import '../api_settings.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ApiSettingController {
  Future<Settings> getSetting() async {
    var url = Uri.parse(ApiSetting.SETTINGS);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return Settings.fromJson(jsonDecode(response.body));
    }
    return throw Exception('Failed to load album');
  }
}
