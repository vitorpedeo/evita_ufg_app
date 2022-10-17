// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/api.dart';

class EditEvaluationRepository {
  final ApiService _apiService = ApiService();

  Future<void> patchEditEvaluation(int? id, Map<String, dynamic> data) async {
    try {
      await _apiService.getApi(needTokenAuth: true).patch(
            '/comment/$id',
            data: data,
          );
    } on DioError catch (e) {
      if (e.response != null) {
        throw e.response!.data['message'];
      } else {
        throw e.message;
      }
    }
  }
}
