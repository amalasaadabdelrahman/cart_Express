class User {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? imageProfile;
  String? rememberToken;
  String? status;
  String? type;
  String? accessToken;

  User(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.imageProfile,
      this.rememberToken,
      this.status,
      this.type,
      this.accessToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    imageProfile = json['image_profile'];
    rememberToken = json['remember_token'];
    status = json['status'];
    type = json['type'];
    accessToken = json['access_token'];
  }
}
