// Project imports:
import 'package:evita_ufg_app/app/data/models/user.dart';

class CommentModel {
  String? id;
  String? content;
  double? rating;
  int? userId;
  int? teacherId;
  String? updatedAt;
  UserModel? user;

  CommentModel({
    this.id,
    this.content,
    this.rating,
    this.userId,
    this.teacherId,
    this.updatedAt,
    this.user,
  });

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    rating = double.parse(json['rating'].toString());
    userId = json['userAccountId'];
    teacherId = json['teacherId'];
    updatedAt = json['updatedAt'];
    user = json['userAccount'] != null
        ? UserModel.fromJson(json['userAccount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['content'] = content;
    data['rating'] = rating;
    data['userAccountId'] = userId;
    data['teacherId'] = teacherId;
    data['updatedAt'] = updatedAt;
    if (user != null) {
      data['userAccount'] = user!.toJson();
    }

    return data;
  }
}
