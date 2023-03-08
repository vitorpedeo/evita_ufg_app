// Project imports:
import 'package:evita_ufg_app/app/data/models/comment.dart';
import 'package:evita_ufg_app/app/data/models/department.dart';

class TeacherModel {
  String? id;
  String? name;
  String? imageUrl;
  String? email;
  double? rating;
  int? evaluations;
  int? departmentId;
  DepartmentModel? department;
  List<CommentModel>? comments;

  TeacherModel({
    this.id,
    this.name,
    this.imageUrl,
    this.email,
    this.rating,
    this.evaluations,
    this.departmentId,
    this.department,
    this.comments,
  });

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    email = json['email'];
    rating = json['rating'] != null
        ? double.parse(
            json['rating'].toString(),
          )
        : 0.0;
    evaluations = json['evaluations'] ?? 0;
    departmentId = json['departmentId'];
    department = json['department'] != null
        ? DepartmentModel.fromJson(json['department'])
        : null;
    comments = json['comments'] != null
        ? json['comments']
            .map<CommentModel>(
              (comment) => CommentModel.fromJson(comment),
            )
            .toList()
        : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['imageUrl'] = imageUrl;
    data['email'] = email;
    data['rating'] = rating;
    data['evaluations'] = evaluations;
    data['departmentId'] = departmentId;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    if (comments != null) {
      data['comments'] = comments!.map((comment) => comment.toJson()).toList();
    }

    return data;
  }
}
