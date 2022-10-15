// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/api.dart';

class HomeRepository {
  final ApiService _apiService = ApiService();

  Future<void> getInvalidateToken() async {
    try {
      await _apiService
          .getApi(
            needTokenAuth: true,
          )
          .get('/logout');
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        throw e.message;
      }
    }
  }
}
