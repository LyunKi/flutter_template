// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/utils/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'router.dart';
import 'utils/logger.dart';

extension MyThemeExtension on ThemeData {
  // 自定义主题属性
  double get spacing => 8.0;
}


Future main() async {
  logger.d('App started');
  SharedPreferences.setPrefix('flutter_template_');
  await dotenv.load(fileName: "../.env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(context, ref) {
    return MaterialApp.router(
      title: 'Auth',
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
      ),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
          brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
        routerConfig: createRouter(),
        scaffoldMessengerKey: globalMessengerKey
    );
  }
}

