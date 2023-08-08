import '../Secreens/citities.dart';
import 'cities.dart';

class BaseResponse {
  bool? status;
  int? code;
  String? message;
  List<Cities>? cities;

  BaseResponse({this.status, this.code, this.message, this.cities});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(Cities.fromJson(v));
      });
    }
  }
}
