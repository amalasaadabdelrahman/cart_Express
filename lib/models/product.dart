class Products {
  int? id;
  int? categoryId;
  double? price;
  String? image;
  int? discount;
  String? offerFrom;
  String? offerTo;
  int? type;
  int? order;
  int? available;
  String? status;
  String? createdAt;
  int? isCart;
  String? availableOffer;
  double? priceOffer;
  String? typeName;
  int? availableInt;
  String? name;
  String? description;
  Products({
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

  Products.fromJson(Map<String, dynamic> json) {
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
