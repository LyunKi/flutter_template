// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_template/business/constants.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:flutter_template/l10n/i18n.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:harmony/harmony.dart';

import 'router/router.dart';

final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(globalSpacing),
      ),
    ),
  ),
);
const _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(),
  contentPadding: EdgeInsets.symmetric(
      vertical: globalSpacing * 2, horizontal: globalSpacing),
);

final _theme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
  elevatedButtonTheme: _elevatedButtonTheme,
  dialogTheme: const DialogTheme(
    barrierColor: Colors.black54,
  ),
  snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
  ),
  inputDecorationTheme: _inputDecorationTheme,
  extensions: <ThemeExtension<dynamic>>[
    lightColorScheme,
  ],
);
final _darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreenAccent, brightness: Brightness.dark)
      .copyWith(),
  elevatedButtonTheme: _elevatedButtonTheme,
  dialogTheme: const DialogTheme(
    barrierColor: Colors.black87,
  ),
  snackBarTheme: const SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    showCloseIcon: true,
  ),
  inputDecorationTheme: _inputDecorationTheme,
  extensions: <ThemeExtension<dynamic>>[
    darkColorScheme,
  ],
);

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  logger.d(
      'App started at ${Uri.base}, countryCode is ${WidgetsBinding.instance.platformDispatcher.locale.countryCode}');
  usePathUrlStrategy();
  await initHarmony();
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
    final queryParameters = Uri.base.queryParameters;
    logger.d("queryParameters: $queryParameters");
    final themeMode = switch (queryParameters["themeMode"]) {
      "dark" => ThemeMode.dark,
      "light" => ThemeMode.light,
      _ => ThemeMode.system,
    };
    final locale = switch (queryParameters["locale"]) {
      "en" => const Locale("en"),
      _ => const Locale("zh")
    };
    initAppI18n(locale);
    initLibI18n(locale);
    initGlobalTheme(isDarkMode(themeMode) ? _darkTheme : _theme);
    configureSmartDialog();
    return MaterialApp.router(
      builder: FlutterSmartDialog.init(),
      title: i18n.cas,
      theme: _theme,
      darkTheme: _darkTheme,
      themeMode: themeMode,
      routerConfig: ref.read(routerProvider),
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        ...LibLocalizations.localizationsDelegates
      ],
      scaffoldMessengerKey: scaffoldMessengerKey,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
