import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/main.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final String? redirect;

  const LoginScreen({super.key, this.redirect});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  PhoneNumber number = PhoneNumber(isoCode: 'CN');

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: themeData.colorScheme.background,
        body: SafeArea(
            child: Center(
          child: Card(
            margin: EdgeInsets.all(themeData.spacing * 2),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: themeData.spacing * 2,
                  vertical: themeData.spacing * 4),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InternationalPhoneNumberInput(
                      inputDecoration: const InputDecoration(
                        labelText: 'Phone',
                        hintText: 'Please input your phone number',
                      ),
                      validator: (value) {
                        return 'false';
                      },
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: SelectorConfig(
                          leadingPadding: themeData.spacing,
                          setSelectorButtonAsPrefixIcon: true,
                          selectorType: PhoneInputSelectorType.DIALOG),
                      ignoreBlank: false,
                      initialValue: number,
                      formatInput: true,
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                    SizedBox(height: themeData.spacing),
                    TextFormField(
                      validator: (value) {
                        return 'false';
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: themeData.spacing * 4),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    themeData.colorScheme.primary),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: themeData.colorScheme.onPrimary),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
