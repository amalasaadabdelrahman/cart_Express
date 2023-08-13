
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_settings.dart';
import '../models/allQ.dart';

class AllQController {
  Future<List<Questions>> getallQ() async {
    Uri uri = Uri.parse(ApiSetting.allQ);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var data = jsonResponse['data'] as List;
      return data.map((jsonObject) => Questions.fromJson(jsonObject)).toList();
    }
    return [];
  }
}
