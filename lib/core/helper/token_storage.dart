import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = "token";
  static const _rememberKey = "remember";

  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  static Future<bool> hasToken() async {
    return await _storage.containsKey(key: _tokenKey);
  }
  static Future<void> saveRememberMeFlag(bool isRemember) async {
    await _storage.write(key: _rememberKey, value: isRemember.toString());
  }
  static Future<bool> getRememberMeFlag() async {
    final value = await _storage.read(key: _rememberKey);
    return value == 'true';
  }
  static Future<void> deleteAll() async {
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _rememberKey);
  }




}
