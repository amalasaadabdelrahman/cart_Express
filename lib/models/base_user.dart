import 'package:cart_express/models/user.dart';

class BaseUser {
  bool? status;
  int? code;
  User? user;

  BaseUser({this.status, this.code, this.user});

  BaseUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}
