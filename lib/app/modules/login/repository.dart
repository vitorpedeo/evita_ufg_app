// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/auth.dart';
import 'package:evita_ufg_app/app/data/services/api.dart';

class LoginRepository {
  final ApiService _apiService = ApiService();

  Future<AuthModel> postLogin(Map<String, dynamic> data) async {
    try {
      Response response =
          await _apiService.getApi().post('/auth/login', data: data);
      var body = response.data;

      return AuthModel.fromJson(body);
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        throw e.message;
      }
    }
  }
}
