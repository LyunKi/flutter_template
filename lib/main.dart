// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/common/utils/state_logger.dart';
import 'package:flutter_template/common/utils/toast.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:harmony/harmony.dart';
import 'package:harmony/constants.dart';

import 'common/utils/logger.dart';
import 'router/router.dart';

extension MyThemeExtension on ThemeData {
  // 自定义主题属性
  double get spacing => 8.0;
}


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  logger.d('App started at ${Uri.base}');
  usePathUrlStrategy();
  await initCountries();
  logger.d('Init countries: ${countries.length}');
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
            // 设置圆角大小
            borderRadius: BorderRadius.circular(8), 
          ),
        ),
      ),
    );
    return MaterialApp.router(
      title: 'Auth',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        elevatedButtonTheme: elevatedButtonTheme,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightGreenAccent, brightness: Brightness.dark),
        elevatedButtonTheme: elevatedButtonTheme,
      ),
      themeMode: ThemeMode.dark,
        routerConfig: router,
      scaffoldMessengerKey: globalMessengerKey,
    );
  }
}

