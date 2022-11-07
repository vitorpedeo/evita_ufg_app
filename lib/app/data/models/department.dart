class DepartmentModel {
  int? id;
  String? name;
  String? regional;

  DepartmentModel({
    this.id,
    this.name,
    this.regional,
  });

  DepartmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    regional = json['regional'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['regional'] = regional;

    return data;
  }
}
