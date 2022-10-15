// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/user.dart';

class StorageService extends GetxService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _tokenKey = '@evita_ufg:token';
  static const String _userKey = '@evita_ufg:user';
  static const String _authenticatedKey = '@evita_ufg:authenticated';

  Rx<String?> token = Rx<String?>(null);
  Rx<UserModel?> user = Rx<UserModel?>(null);
  RxBool authenticated = false.obs;

  Future<StorageService> init() async {
    token.value = await getToken();
    user.value = await getUser();
    authenticated.value = await getAuthenticated();

    return this;
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }

  Future<void> setToken(String? value) async {
    await _storage.write(key: _tokenKey, value: value);
    token.value = value;
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: _tokenKey);

    return token;
  }

  Future<void> setUser(UserModel? value) async {
    await _storage.write(
      key: _userKey,
      value: jsonEncode(
        value?.toJson(),
      ),
    );
    user.value = value;
  }

  Future<UserModel?> getUser() async {
    String? user = await _storage.read(key: _userKey);

    if (user != null) {
      return UserModel.fromJson(jsonDecode(user));
    }

    return null;
  }

  Future<void> setAuthenticated(bool value) async {
    await _storage.write(
      key: _authenticatedKey,
      value: value.toString(),
    );
    authenticated.value = value;
  }

  Future<bool> getAuthenticated() async {
    bool authenticated = await _storage.read(key: _authenticatedKey) == 'true';

    return authenticated;
  }
}
