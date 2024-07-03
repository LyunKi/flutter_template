import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/screen/auth/auth_main.dart';

import 'auth_logo.dart';


class AuthScreen extends ConsumerStatefulWidget {
  final String? redirect;

  const AuthScreen({super.key, this.redirect});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: themeData.colorScheme.background,
        body: SafeArea(
            child: Column(
                children: [const AuthLogo(), AuthMain(themeData: themeData)])));
  }
}
