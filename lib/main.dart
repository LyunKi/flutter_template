// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/common/constants.dart';
import 'package:flutter_template/common/utils/state_logger.dart';
import 'package:flutter_template/common/utils/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'router/router.dart';
import 'common/utils/logger.dart';

extension MyThemeExtension on ThemeData {
  // 自定义主题属性
  double get spacing => 8.0;
}


Future main() async {
  logger.d('App started at ${Uri.base}');
  SharedPreferences.setPrefix('flutter_template_');
  await dotenv.load(fileName: "../.env");
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
    return MaterialApp.router(
      title: 'Auth',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
      ),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
          brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
        routerConfig: router,
        scaffoldMessengerKey: globalMessengerKey
    );
  }
}

