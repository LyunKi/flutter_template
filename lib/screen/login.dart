import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Wrap(spacing: 8, children: [
          TextButton(
              onPressed: () => context.go('/'), child: const Text('back'))
        ]),
      ),
    ));
  }
}
