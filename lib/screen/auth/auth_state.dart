import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthType {
  loginByPassword,
  register,
  resetPassword,
}

final authTypeProvider = StateProvider<AuthType>(
  (ref) => AuthType.register,
);
