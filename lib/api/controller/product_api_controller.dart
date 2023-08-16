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
    return [];
  }

  Future<List<Products>?> getVegetables() async {
    var url = Uri.parse(ApiSetting.VEGETABELS);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      BaseProduct baseProduct = BaseProduct.fromJson(jsonDecode(response.body));
      return baseProduct.products;
    }
    return [];
  }

  Future<List<Products>?> getLeaves() async {
    var url = Uri.parse(ApiSetting.LEAVES);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      BaseProduct baseProduct = BaseProduct.fromJson(jsonDecode(response.body));
      return baseProduct.products;
    }
    return [];
  }

  Future<List<Products>?> getChichens() async {
    var url = Uri.parse(ApiSetting.CHICKENS);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      BaseProduct baseProduct = BaseProduct.fromJson(jsonDecode(response.body));
      return baseProduct.products;
    }
    return [];
  }

  Future<List<Products>?> getMeat() async {
    var url = Uri.parse(ApiSetting.MEAT);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      BaseProduct baseProduct = BaseProduct.fromJson(jsonDecode(response.body));
      return baseProduct.products;
    }
    return [];
  }

  Future<List<Products>?> getBakery() async {
    var url = Uri.parse(ApiSetting.BAKERY);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      BaseProduct baseProduct = BaseProduct.fromJson(jsonDecode(response.body));
      return baseProduct.products;
    }
    return [];
  }
}
