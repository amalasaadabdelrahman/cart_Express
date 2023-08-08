import 'package:cart_express/models/translations.dart';

class Cities {
  int? id;
  int? deliveryCost;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? name;
  List<Translations>? translations;

  Cities(
      {this.id,
      this.deliveryCost,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.name,
      this.translations});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryCost = json['deliveryCost'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    name = json['name'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
  }
}
