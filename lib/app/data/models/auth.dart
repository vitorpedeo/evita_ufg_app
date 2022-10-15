// Project imports:
import 'package:evita_ufg_app/app/data/models/user.dart';

class AuthModel {
  UserModel? user;
  String? token;

  AuthModel({
    this.user,
    this.token,
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    user = json['data'] != null ? UserModel.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (user != null) {
      data['data'] = user!.toJson();
    }
    data['token'] = token;

    return data;
  }
}
