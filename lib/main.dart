// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/common/utils/toast.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:harmony/utils/logger.dart';
import 'package:harmony/utils/state_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:harmony/harmony.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'router/router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  logger.d(
      'App started at ${Uri.base}, countryCode is ${WidgetsBinding.instance.platformDispatcher.locale.countryCode}');
  usePathUrlStrategy();
  await initCountries();
  SharedPreferences.setPrefix('flutter_template_');
  await dotenv.load(fileName: ".env");
  List<ProviderObserver>? observers;
  if (dotenv.env[mode]! == debugMode) {
    observers = [const StateLogger()];
  }

  runApp(ProviderScope(observers: observers, child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(context, ref) {
    final router = ref.read(routerProvider);
    final elevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(globalSpacing),
          ),
        ),
      ),
    );
    const inputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(
          vertical: globalSpacing * 2, horizontal: globalSpacing),
    );
    return MaterialApp.router(
      title: 'Auth',
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
          elevatedButtonTheme: elevatedButtonTheme,
          inputDecorationTheme: inputDecorationTheme),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightGreenAccent, brightness: Brightness.dark),
        elevatedButtonTheme: elevatedButtonTheme,
        inputDecorationTheme: inputDecorationTheme,
      ),
      themeMode: ThemeMode.light,
        routerConfig: router,
      scaffoldMessengerKey: globalMessengerKey,
      localizationsDelegates: [
        ...AppLocalizations.localizationsDelegates,
        ...LibLocalizations.localizationsDelegates
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
