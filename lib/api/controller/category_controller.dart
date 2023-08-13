
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api_settings.dart';
import '../models/category.dart';

class CategoryController {
  Future<List<MyCategory>> getCategory() async {
    Uri uri = Uri.parse(ApiSetting.category);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var data = jsonResponse['data'] as List;
      return data.map((jsonObject) => MyCategory.fromJson(jsonObject)).toList();
    }
    return [];
  }
}
