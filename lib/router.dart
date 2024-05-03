import 'package:flutter_template/widgets/auth_guard.dart';
import 'package:go_router/go_router.dart';

import 'screen/index.dart';
import 'screen/login.dart';
import 'screen/user.dart';

GoRouter createRouter() {
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
              return AuthGuard(
                fallbackAction: () {
                  final redirect = state.uri.queryParameters['redirect'];
                  if (redirect != null) {
                    context.go('/$redirect');
                  } else {
                    context.go('/');
                  }
                },
                child: const LoginScreen(),
                checker: (maybeUser) async {
                  return maybeUser == null;
                },
              );
            },
          ),
          GoRoute(
            path: 'user',
            builder: (context, state) {
              return AuthGuard(
                  fallbackAction: () {
                    context.go('/login?redirect=user');
                  },
                  child: const UserScreen());
            },
          ),
        ],
      ),
    ],
  );
}
