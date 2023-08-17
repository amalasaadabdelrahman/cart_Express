import 'package:cart_express/models/offers.dart';

class BaseOffers {
  bool? status;
  int? code;
  String? message;
  List<OffersModel>? offers;

  BaseOffers({this.status, this.code, this.message, this.offers});

  BaseOffers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['offers'] != null) {
      offers = <OffersModel>[];
      json['offers'].forEach((v) {
        offers!.add(OffersModel.fromJson(v));
      });
    }
  }
}
