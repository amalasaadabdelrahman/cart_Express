class Settings {
  int? id;
  String? url;
  String? logo;
  String? appStoreUrl;
  String? playStoreUrl;
  String? infoEmail;
  String? mobile;
  String? phone;
  String? facebook;
  String? twitter;
  String? linkedIn;
  String? instagram;
  String? googlePlus;
  dynamic minOrder;
  String? fromHour;
  String? toHour;
  int? enforceClose;
  String? latitude;
  String? longitude;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? joinDescription;
  String? description;
  String? address;
  String? keyWords;

  Settings(
      {this.id,
      this.url,
      this.logo,
      this.appStoreUrl,
      this.playStoreUrl,
      this.infoEmail,
      this.mobile,
      this.phone,
      this.facebook,
      this.twitter,
      this.linkedIn,
      this.instagram,
      this.googlePlus,
      this.minOrder,
      this.fromHour,
      this.toHour,
      this.enforceClose,
      this.latitude,
      this.longitude,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.joinDescription,
      this.description,
      this.address,
      this.keyWords});

  Settings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    logo = json['logo'];
    appStoreUrl = json['app_store_url'];
    playStoreUrl = json['play_store_url'];
    infoEmail = json['info_email'];
    mobile = json['mobile'];
    phone = json['phone'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedIn = json['linked_in'];
    instagram = json['instagram'];
    googlePlus = json['google_plus'];
    minOrder = json['min_order'];
    fromHour = json['from_hour'];
    toHour = json['to_hour'];
    enforceClose = json['enforce_close'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    joinDescription = json['join_description'];
    description = json['description'];
    address = json['address'];
    keyWords = json['key_words'];
  }
}
