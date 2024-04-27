import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        const Text("Login"),
        BackButton(
          onPressed: () => context.goNamed('index'),
        )
      ]),
    ));
  }
}
