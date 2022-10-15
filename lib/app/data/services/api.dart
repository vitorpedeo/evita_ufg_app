// Package imports:
import 'package:dio/dio.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/storage.dart';

class ApiService {
  final _storageService = Get.find<StorageService>();

  Dio getApi({bool needTokenAuth = false}) {
    if (needTokenAuth) {
      String? token = _storageService.token.value;

      return Dio(
        BaseOptions(
          baseUrl: 'http://192.168.0.169:5000/api',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
    }

    return Dio(
      BaseOptions(
        baseUrl: 'http://192.168.0.169:5000/api',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}
