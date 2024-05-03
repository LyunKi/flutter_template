import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/state/user.dart';
import 'package:flutter_template/utils/toast.dart';
import 'package:flutter_template/widgets/loading_spinner.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final String? redirect;

  const LoginScreen({super.key, this.redirect});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateProvider);
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Wrap(
        spacing: Theme.of(context).spacing,
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          SizedBox(
            width: 150,
            child: TextField(
              autofocus: true,
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User id',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                String textValue = _controller.text;
                await ref.read(userStateProvider.notifier).login(textValue);
                if (!context.mounted) {
                  return;
                }
                if (widget.redirect != null) {
                  context.go(widget.redirect!);
                  return;
                }
                if (context.canPop()) {
                  context.pop();
                  return;
                }
                context.go('/index');
              } catch (e) {
                globalMessengerKey.currentState?.showSnackBar(
                    const SnackBar(content: Text("Login failed")));
              }
            },
            child: SizedBox(
              width: 150,
              child: Wrap(
                spacing: Theme.of(context).spacing,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  user.isLoading ? const LoadingSpinner() : Container(),
                  const Text('Login')
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
