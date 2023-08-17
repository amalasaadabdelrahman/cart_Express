import 'package:cart_express/models/setting.dart';

class BaseSetting {
  bool? status;
  int? code;
  String? message;
  Settings? settings;

  BaseSetting({this.status, this.code, this.message, this.settings});

  BaseSetting.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    settings =
        json['settings'] != null ? Settings.fromJson(json['settings']) : null;
  }
}
