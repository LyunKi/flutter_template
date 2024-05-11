import 'package:flutter_template/common/utils/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../common/utils/logger.dart';

part 'user.g.dart';

@riverpod
class UserState extends _$UserState {
  static const _tokenStorageKey = 'token';
  late SharedPreferences _sharedPreferences;

  void _initPersistenceRefreshListener() {
    ref.listenSelf((_, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        _sharedPreferences.remove(_tokenStorageKey);
        return;
      }
      if (next.requireValue == null) {
        _sharedPreferences.remove(_tokenStorageKey);
        return;
      }
      _sharedPreferences.setString(_tokenStorageKey, next.requireValue!.token);
    });
  }

  @override
  Future<User?> build() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _initPersistenceRefreshListener();
    return _getUserFromStorage();
  }

  Future<void> login(String userId) async {
    state = const AsyncValue.loading();
    try {
      final response = await api.get('/demo/users/$userId');
      final userJson = response.data;
      final user = User.fromJson(userJson);
      state = AsyncValue.data(user);
    } catch (e) {
      state = const AsyncValue.data(null);
      rethrow;
    }
  }

  Future<User> loginByToken(String token) async {
    try {
      final response = await api.get('/demo/users/$token');
      final userJson = response.data;
      return User.fromJson(userJson);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.data(null);
    // TODO: notify server to logout
  }

  Future<User?> _getUserFromStorage() async {
    try {
      final token = _sharedPreferences.getString(_tokenStorageKey);
      if (token != null) {
        return loginByToken(token);
      }
    } catch (e) {
      logger.e("Failed to get user from storage: $e");
    }
    return null;
  }
}

AsyncValue<bool> isLoginSelector(AsyncValue<User?> data) {
  return data.whenData((value) => null != value);
}
