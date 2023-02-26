class UserModel {
  String? id;
  String? name;
  String? avatarUrl;
  String? email;
  String? createdAt;

  UserModel({
    this.id,
    this.name,
    this.avatarUrl,
    this.email,
    this.createdAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatarUrl = json['avatarUrl'];
    email = json['email'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['avatarUrl'] = avatarUrl;
    data['email'] = email;
    data['createdAt'] = createdAt;

    return data;
  }

  Map<String, dynamic> toFirebaseJson() {
    final data = <String, dynamic>{};

    data['name'] = name;
    data['avatarUrl'] = avatarUrl;
    data['email'] = email;
    data['createdAt'] = createdAt;

    return data;
  }
}
