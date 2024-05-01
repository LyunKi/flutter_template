// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router.dart';

void main() => runApp(const ProviderScope(child: MyApp()));
 
/// The route configuration.
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(context, ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

