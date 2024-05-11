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
    initialLocation: const SplashRoute().location,
    debugLogDiagnostics: dotenv.env[mode]! == debugMode,
    routes: $appRoutes,
    redirect: (context, state) {
      final isLoggingIn = state.uri.path == const LoginRoute().location;
      if (isAuth.value.unwrapPrevious().hasError) {
        return isLoggingIn ? null : const LoginRoute().location;
      }

      final isSplash = state.uri.path == const SplashRoute().location;
      if (isAuth.value.isLoading || !isAuth.value.hasValue) {
        return isSplash ? null : const SplashRoute().location;
      }

      final auth = isAuth.value.requireValue;
      if (isSplash) {
        return auth ? const HomeRoute().location : const LoginRoute().location;
      }
      if (isLoggingIn) {
        return auth ? const HomeRoute().location : null;
      }
      return auth ? null : const SplashRoute().location;
    },
  );
  ref.onDispose(router.dispose);
  return router;
}
