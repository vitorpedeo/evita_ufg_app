// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Project imports:
import 'package:evita_ufg_app/app/data/models/user.dart';

class StorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const String _tokenKey = 'token';
  static const String _userKey = 'user';
  static const String _authenticatedKey = 'authenticated';

  Future<void> saveToken(String? token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: _tokenKey);

    return token;
  }

  Future<void> saveUser(UserModel? user) async {
    await _storage.write(
      key: _userKey,
      value: jsonEncode(
        user?.toJson(),
      ),
    );
  }

  Future<UserModel?> getUser() async {
    String? user = await _storage.read(key: _userKey);

    if (user != null) {
      return UserModel.fromJson(jsonDecode(user));
    }

    return null;
  }

  Future<void> saveAuthenticated(bool state) async {
    await _storage.write(
      key: _authenticatedKey,
      value: state.toString(),
    );
  }

  Future<bool> getAuthenticated() async {
    bool authenticated = await _storage.read(key: _authenticatedKey) == 'true';

    return authenticated;
  }
}
