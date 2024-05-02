import 'package:flutter_template/screen/splash.dart';
import 'package:flutter_template/state/user.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'screen/index.dart';
import 'screen/login.dart';
import 'screen/user.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const IndexScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'splash',
            builder: (context, state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: 'login',
            builder: (context, state) {
              return const SplashScreen();
            },
            redirect: (context, state) async {
              final isLogin =
                  ref.read(userStateProvider.select(isLoginSelector));
              return isLogin.whenOrNull(
                data: (value) => value ? '/index' : null,
              );
            },
          ),
          GoRoute(
            path: 'user',
            builder: (context, state) {
              return const UserScreen();
            },
            redirect: (context, state) async {
              final isLogin =
                  ref.read(userStateProvider.select(isLoginSelector));
              return isLogin.when(
                loading: () => '/splash',
                error: (err, strace) => '/login',
                data: (value) => value ? null : '/login',
              );
            },
          ),
        ],
      ),
    ],
  );
}
