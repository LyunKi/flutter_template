import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/router/routes.dart';
import 'package:flutter_template/state/user.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  ref
    ..onDispose(isAuth.dispose)
    ..listen(
      userStateProvider.select(isLoginSelector),
      (_, next) {
        isAuth.value = next;
      },
    );

  final router = GoRouter(
    navigatorKey: routerKey,
    refreshListenable: isAuth,
    initialLocation: const LoginRoute().location,
    debugLogDiagnostics: dotenv.env[mode]! == debugMode,
    routes: $appRoutes,
  );
  ref.onDispose(router.dispose);
  return router;
}
