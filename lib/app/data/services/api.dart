// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/services/storage.dart';

class ApiService {
  final _storageService = Get.find<StorageService>();

  Dio getApi({bool needTokenAuth = false}) {
    final BaseOptions options = BaseOptions(
      baseUrl: 'https://evita-ufg-api-staging.up.railway.app/api',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (needTokenAuth) {
      final String? token = _storageService.token.value;

      options.headers.addAll({'Authorization': 'Bearer $token'});
    }

    final Dio dio = Dio(options);

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: false,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
