import 'package:cart_express/models/questions.dart';

class BaseAllQ {
  bool? status;
  int? code;
  String? message;
  List<Questions>? questions;

  BaseAllQ({this.status, this.code, this.message, this.questions});

  BaseAllQ.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }
}
