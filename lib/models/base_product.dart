import 'package:cart_express/models/product.dart';

class BaseProduct {
  bool? status;
  int? code;
  String? message;
  int? countProducts;
  int? totalCart;
  List<Products>? products;

  BaseProduct(
      {this.status,
      this.code,
      this.message,
      this.countProducts,
      this.totalCart,
      this.products});

  BaseProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    countProducts = json['count_products'];
    totalCart = json['total_cart'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }
}
