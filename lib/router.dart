import 'package:flutter_template/state/user.dart';
import 'package:flutter_template/widgets/auth_guard.dart';
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
            path: 'login',
            builder: (context, state) {
              return LoginScreen(
                  redirect: state.uri.queryParameters['redirect']);
            },
            redirect: (context, state) {
              final user = ref.read(userStateProvider);
              if (user.hasValue && user.value != null) {
                final redirect = state.uri.queryParameters['redirect'];
                if (redirect != null) {
                  return redirect;
                }
                return '/';
              }
              return null;
            },
          ),
          GoRoute(
            path: 'user',
            builder: (context, state) {
              return AuthGuard(
                  fallbackAction: () {
                    context.go('/login?redirect=/user');
                  },
                  child: const UserScreen());
            },
          ),
        ],
      ),
    ],
  );
}
