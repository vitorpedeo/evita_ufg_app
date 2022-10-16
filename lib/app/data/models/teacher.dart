class TeacherModel {
  int? id;
  String? name;
  String? email;
  double? rating;
  int? evaluations;
  int? departmentId;

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    rating = double.parse(json['rating'].toString());
    evaluations = json['evaluations'];
    departmentId = json['department_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['rating'] = rating;
    data['evaluations'] = evaluations;
    data['department_id'] = departmentId;

    return data;
  }
}
