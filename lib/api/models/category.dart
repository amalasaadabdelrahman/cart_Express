class MyCategory {
  late int id;
  late String image;
  late String status;
  late String createdAt;
  late String name;
  late List<Translations> translations;

  MyCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    name = json['name'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(new Translations.fromJson(v));
      });
    }
  }
}

class Translations {
  late int id;
  late int categoryId;
  late String locale;
  late String name;
  late Null deletedAt;
  late String createdAt;
  late String updatedAt;

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    locale = json['locale'];
    name = json['name'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
