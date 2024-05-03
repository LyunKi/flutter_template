import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/state/user.dart';
import 'package:flutter_template/utils/toast.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<ConsumerStatefulWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Wrap(
            spacing: Theme.of(context).spacing,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const SizedBox(
                width: 150,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User id',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await ref
                          .read(userStateProvider.notifier)
                          .login(_controller.text);
                    } catch (e) {
                      globalMessengerKey.currentState?.showSnackBar(
                          const SnackBar(content: Text("Login failed")));
                    }
                  },
                  child: const Text('Login'))
        ]),
      ),
    ));
  }
}
