import 'dart:convert';

import 'package:cart_express/models/base_allq.dart';
import 'package:cart_express/models/questions.dart';

import '../api_settings.dart';
import 'package:http/http.dart' as http;

class AllQApiController {
  Future<List<Questions>?> AllQController() async {
    var url = Uri.parse(ApiSetting.ALLQ);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      BaseAllQ baseAllQ = BaseAllQ.fromJson(jsonDecode(response.body));
      return baseAllQ.questions;
    }
    return [];
  }
}
