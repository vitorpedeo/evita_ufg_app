// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/teacher.dart';
import 'package:evita_ufg_app/app/data/services/api.dart';

class TeacherRepository {
  final ApiService _apiService = ApiService();

  Future<TeacherModel> getTeacherById(int id) async {
    try {
      final response = await _apiService
          .getApi(
            needTokenAuth: true,
          )
          .get('/teacher/$id');
      var body = response.data;

      TeacherModel teacher = TeacherModel.fromJson(body['data']);

      return teacher;
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        throw e.message;
      }
    }
  }

  Future<void> deleteComment(int id) async {
    try {
      await _apiService
          .getApi(
            needTokenAuth: true,
          )
          .delete('/comment/$id');
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        throw e.message;
      }
    }
  }
}
