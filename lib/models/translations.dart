class Translations {
  int? id;
  int? cityId;
  int? categoryId;
  String? locale;
  String? name;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Translations(
      {this.id,
      this.cityId,
      this.locale,
      this.name,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.categoryId});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    locale = json['locale'];
    name = json['name'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['categoryId'];
  }
}
