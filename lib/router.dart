import 'package:flutter_template/state/user.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'screen/index.dart';
import 'screen/login.dart';
import 'screen/user.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final isLogin = ref.watch(userStateProvider.select(isLoginSelector));
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const IndexScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (context, state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: 'user',
            builder: (context, state) {
              return const UserScreen();
            },
            redirect: (context, state) async {
              return isLogin.whenOrNull(
                  data: (value) => value ? '/login' : null);
            },
          ),
        ],
      ),
    ],
  );
}
