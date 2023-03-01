// Project imports:
import 'package:evita_ufg_app/app/data/models/user.dart';

class CommentModel {
  String? id;
  String? content;
  double? rating;
  int? userId;
  int? teacherId;
  DateTime? updatedAt;
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
    userId = json['user_account_id'];
    teacherId = json['teacher_id'];
    updatedAt = DateTime.parse(json['updated_at']);
    user = json['user_account'] != null
        ? UserModel.fromJson(json['user_account'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['content'] = content;
    data['rating'] = rating;
    data['user_account_id'] = userId;
    data['teacher_id'] = teacherId;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user_account'] = user!.toJson();
    }

    return data;
  }
}
