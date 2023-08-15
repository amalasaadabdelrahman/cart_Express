import 'dart:convert';
import 'package:cart_express/api/api_settings.dart';
import 'package:http/http.dart' as http;
import '../../models/base_category.dart';
import '../../models/category.dart';
import 'dart:async';

class CategoryApiController {
  Future<List<Categories>?> getCategory() async {
    var url = Uri.parse(ApiSetting.CATIGORIES);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      BaseCategory baseCategory =
          BaseCategory.fromJson(jsonDecode(response.body));
      return baseCategory.categories;
    }
    return [];
  }
}
