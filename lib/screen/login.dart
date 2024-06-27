import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/business/constants.dart';
import 'package:harmony/harmony.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harmony/utils/logger.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final String? redirect;

  const LoginScreen({super.key, this.redirect});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  var _passwordVisible = false;

  PhoneNumber? _phoneNumber;
  String? _password;

  PhoneNumber number = PhoneNumber.fromCca2Code(
      WidgetsBinding.instance.platformDispatcher.locale.countryCode);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final i18n = AppLocalizations.of(context)!;
    return Scaffold(
        backgroundColor: themeData.colorScheme.background,
        body: SafeArea(
            child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: themeData.spacing * 2),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: themeData.spacing * 2,
                  vertical: themeData.spacing * 4),
              child: Form(
                key: _loginFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      i18n.welcome,
                      style: themeData.textTheme.titleLarge,
                    ),
                    SizedBox(height: themeData.spacing * 2),
                    PhoneNumberFormField(
                      validator: (value) {
                        final isValid = value?.isValid() ?? false;
                        if (!isValid) {
                          return i18n.invalidPhoneNumber;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _phoneNumber = value;
                      },
                      initialValue: number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: i18n.phoneNumber,
                      ),
                    ),
                    SizedBox(height: themeData.spacing),
                    TextFormField(
                      validator: (value) {
                        if (value == null || !passwordRegex.hasMatch(value)) {
                          return i18n.invalidPassword;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        labelText: i18n.password,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      obscureText: !_passwordVisible,
                    ),
                    SizedBox(height: themeData.spacing),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    themeData.colorScheme.primary),
                              ),
                              onPressed: () {
                                if (_loginFormKey.currentState?.validate() ==
                                    true) {
                                  _loginFormKey.currentState!.save();
                                  logger.d(
                                      "Login by password, ${_phoneNumber?.format()}, $_password");
                                }
                              },
                              child: Text(
                                i18n.login,
                                style: TextStyle(
                                    color: themeData.colorScheme.onPrimary),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(height: themeData.spacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: () {}, child: Text(i18n.welcome))
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
