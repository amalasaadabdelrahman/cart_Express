import 'category.dart';

class BaseCategory {
  bool? status;
  int? code;
  String? message;
  List<Categories>? categories;

  BaseCategory({this.status, this.code, this.message, this.categories});

  BaseCategory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }
}
