// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/api.dart';

class CreateAccountRepository {
  final ApiService _apiService = ApiService();

  Future<void> postNewAccount(Map<String, dynamic> data) async {
    try {
      await _apiService.getApi().post('/auth/register', data: data);
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        throw e.message;
      }
    }
  }
}
