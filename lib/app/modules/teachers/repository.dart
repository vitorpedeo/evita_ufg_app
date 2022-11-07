// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/data/services/api.dart';

class TeachersRepository {
  final ApiService _apiService = ApiService();

  Future<List<TeacherModel>> getTeacherByDepartmentId(int id) async {
    try {
      Response response = await _apiService
          .getApi(needTokenAuth: true)
          .get('/department/$id/teacher');
      var body = response.data;

      List<TeacherModel> teachers = body['data']
          .map<TeacherModel>((teacher) => TeacherModel.fromJson(teacher))
          .toList();

      return teachers;
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        throw e.message;
      }
    }
  }
}
