
import '../../models/translations.dart';

class Questions {
  late int id;
  late String status;
  late String createdAt;
  late String question;
  late String answer;
  late List<Translations> translations;

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    question = json['question'];
    answer = json['answer'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }}


class Translations {
  late int id;
  late int questionId;
  late String locale;
  late String question;
  late String answer;
  late String createdAt;
  late String updatedAt;
  late Null deletedAt;


  Translations.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  questionId = json['question_id'];
  locale = json['locale'];
  question = json['question'];
  answer = json['answer'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  deletedAt = json['deleted_at'];
  }


  }
