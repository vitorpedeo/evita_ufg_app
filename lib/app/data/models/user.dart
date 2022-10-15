class UserModel {
  int? id;
  String? name;
  String? avatarUrl;
  String? email;
  String? password;

  UserModel({
    this.id,
    this.name,
    this.avatarUrl,
    this.email,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatarUrl = json['avatar_url'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['avatar_url'] = avatarUrl;
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
