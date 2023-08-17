import 'dart:convert';

import 'package:cart_express/models/base_offers.dart';
import 'package:cart_express/models/offers.dart';
import 'package:http/http.dart' as http;
import '../api_settings.dart';

class OffersApiController {
  Future<List<OffersModel>?> getOffers() async {
    var url = Uri.parse(ApiSetting.OFFERS);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      BaseOffers baseOffers = BaseOffers.fromJson(jsonDecode(response.body));
      return baseOffers.offers;
    }
    return [];
  }
}
