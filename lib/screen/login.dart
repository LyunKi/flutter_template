import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:harmony/harmony.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends ConsumerStatefulWidget {
  final String? redirect;

  const LoginScreen({super.key, this.redirect});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

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
                    SizedBox(height: themeData.spacing),
                    PhoneNumberFormField(
                      validator: (value) {
                        return 'false';
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
                        return 'false';
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          labelText: i18n.password,
                        prefixIcon: Icon(Icons.lock)
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: themeData.spacing * 2),
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
                                i18n.login,
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
