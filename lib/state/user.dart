import 'dart:convert';

import 'package:flutter_template/utils/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../utils/logger.dart';

part 'user.g.dart';

const userStorageKey = 'user';

@riverpod
class UserState extends _$UserState {
  @override
  Future<User?> build() async {
    return _getUserFromStorage();
  }

  Future<void> login(String userId) async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await api.get('/demo/users/$userId');
      final userJson = response.data;
      final user = User.fromJson(userJson);
      final storage = await SharedPreferences.getInstance();
      await storage.setString(userStorageKey, jsonEncode(userJson));
      state = AsyncValue.data(user);
    } catch (e) {
      state = const AsyncValue.data(null);
      rethrow;
    }
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    await Future.delayed(const Duration(seconds: 2));
    try {
      final storage = await SharedPreferences.getInstance();
      await storage.remove(userStorageKey);
      state = const AsyncValue.data(null);
    } catch (e) {
      state = const AsyncValue.data(null);
      rethrow;
    }

  }

  Future<User?> _getUserFromStorage() async {
    final storage = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));
    try {
      final userStr = storage.getString(userStorageKey);
      if (userStr != null) {
        return User.fromJson(jsonDecode(userStr));
      }
    } catch (e) {
      logger.e("Failed to get user from storage: $e");
      storage.remove(userStorageKey);
      return null;
    }
    return null;
  }
}

AsyncValue<bool> isLoginSelector(AsyncValue<User?> data) {
  return data.whenData((value) => null != value);
}
