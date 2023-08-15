import 'dart:convert';

import 'package:cart_express/api/api_settings.dart';
import 'package:cart_express/models/base_product.dart';

import '../../models/product.dart';
import 'package:http/http.dart' as http;

class ProductApiController {
  Future<List<Products>?> getFruits() async {
    var url = Uri.parse(ApiSetting.FRUITS);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      BaseProduct baseProduct = BaseProduct.fromJson(jsonDecode(response.body));
      return baseProduct.products;
    }
  }
}
