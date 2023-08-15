class Categories {
  int? id;
  String? image;
  String? status;
  String? createdAt;
  String? name;

  Categories({
    this.id,
    this.image,
    this.status,
    this.createdAt,
    this.name,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    name = json['name'];
  }
}
