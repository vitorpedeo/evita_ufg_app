// Package imports:
import 'package:dio/dio.dart';

class ApiService {
  Dio getApi() {
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
