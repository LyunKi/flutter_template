// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/business/constants.dart';
import 'package:flutter_template/business/utils/toast.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:flutter_template/l10n/i18n.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:harmony/harmony.dart';

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
  runApp(ProviderScope(
      observers: observers,
      child: ResponsiveApp((BuildContext _) {
        return const MyApp();
      })));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(context, ref) {
    final elevatedButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
    const theme = ThemeMode.dark;
    const locale = Locale('en');
    i18n = lookupAppLocalizations(locale);
    return MaterialApp.router(
      title: i18n.cas,
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
      themeMode: theme,
      routerConfig: ref.read(routerProvider),
      scaffoldMessengerKey: globalMessengerKey,
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        ...LibLocalizations.localizationsDelegates
      ],
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
