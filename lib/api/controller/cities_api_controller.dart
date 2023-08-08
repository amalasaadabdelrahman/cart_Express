import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/base_response.dart';
import '../api_settings.dart';

class ApiCitiesController {
  Future<BaseResponse> getCities() async {
    var url = Uri.parse(ApiSetting.CITIES);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return BaseResponse.fromJson(jsonDecode(response.body));
    }
    return throw Exception('Failed to load album');
  }
}
