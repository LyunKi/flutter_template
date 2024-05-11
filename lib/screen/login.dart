import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/main.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final String? redirect;

  const LoginScreen({super.key, this.redirect});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Center(
      child: Card(
        margin: EdgeInsets.all(themeData.spacing * 2),
        child: Padding(
          padding: EdgeInsets.all(themeData.spacing * 2),
          child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone number',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(height: themeData.spacing),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: themeData.spacing * 4),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () {},
                          child: Text('Login'),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ))));
  }
}
