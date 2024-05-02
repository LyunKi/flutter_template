// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';

extension MyThemeExtension on ThemeData {
  // 自定义主题属性
  double get spacing => 8.0;
}

void main() => runApp(const ProviderScope(child: MyApp()));
 
/// The route configuration.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(context, ref) {
    final router = ref.watch(routerProvider);
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
    );
  }
}

