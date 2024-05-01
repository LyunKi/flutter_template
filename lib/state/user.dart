import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';

part 'user.g.dart';

@riverpod
class UserState extends _$UserState {
  @override
  Future<User?> build() async {
    Future.delayed(const Duration(seconds: 1));
    return null;
  }
}

AsyncValue<bool> isLoginSelector(AsyncValue<User?> data) {
  return data.whenData((value) => null == value);
}
