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
    state = await AsyncValue.guard(() async {
      final response = await api.get('/users/$userId');
      return User.fromJson(response.data);
    });
  }

  Future<User?> _getUserFromStorage() async {
    final storage = await SharedPreferences.getInstance();
    try {
      final userJson = storage.getString(userStorageKey);
      if (userJson != null) {
        return User.fromJson(json.decode(userJson));
      }
    } catch (e) {
      logger.e("Invalid user type: $e");
      storage.remove(userStorageKey);
      return null;
    }
    return null;
  }
}

AsyncValue<bool> isLoginSelector(AsyncValue<User?> data) {
  return data.whenData((value) => null != value);
}
