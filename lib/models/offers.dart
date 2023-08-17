class OffersModel {
  int? id;
  int? categoryId;
  dynamic price;
  String? image;
  dynamic discount;
  String? offerFrom;
  String? offerTo;
  int? type;
  int? order;
  int? available;
  String? status;
  String? createdAt;
  String? isCart;
  String? availableOffer;
  dynamic priceOffer;
  String? typeName;
  int? availableInt;
  String? name;
  String? description;

  OffersModel({
    this.id,
    this.categoryId,
    this.price,
    this.image,
    this.discount,
    this.offerFrom,
    this.offerTo,
    this.type,
    this.order,
    this.available,
    this.status,
    this.createdAt,
    this.isCart,
    this.availableOffer,
    this.priceOffer,
    this.typeName,
    this.availableInt,
    this.name,
    this.description,
  });

  OffersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    price = json['price'];
    image = json['image'];
    discount = json['discount'];
    offerFrom = json['offer_from'];
    offerTo = json['offer_to'];
    type = json['type'];
    order = json['order'];
    available = json['available'];
    status = json['status'];
    createdAt = json['created_at'];
    isCart = json['is_cart'];
    availableOffer = json['available_offer'];
    priceOffer = json['price_offer'];
    typeName = json['type_name'];
    availableInt = json['available_int'];
    name = json['name'];
    description = json['description'];
  }
}
