import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_template/business/validators/string.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:harmony/harmony.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _loginFormKey = GlobalKey<FormState>();

  PhoneNumber? _phoneNumber;
  String? _password;
  String? _verificationCode;

  PhoneNumber number = PhoneNumber.fromCca2Code(
      WidgetsBinding.instance.platformDispatcher.locale.countryCode);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final i18n = AppLocalizations.of(context)!;
    CountryListMode countryListMode =
        isBigScreen() ? CountryListMode.modal : CountryListMode.page;

    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PhoneNumberFormField(
            countryListMode: countryListMode,
            validator: phoneNumberValidator,
            onSaved: (value) {
              _phoneNumber = value;
            },
            onChanged: (value) {
              setState(() {
                _phoneNumber = value;
              });
            },
            initialValue: number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: i18n.phoneNumber,
            ),
          ),
          SizedBox(height: themeData.spacing),
          VerificationCodeFormField(
            onSend: () {},
            validator: createStringSizeValidator(6),
            onSaved: (value) {
              _verificationCode = value;
            },
            onChanged: (value) {
              _verificationCode = value;
            },
            disabled: _phoneNumber?.isValid() != true,
            decoration: InputDecoration(
              labelText: i18n.verificationCode,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          SizedBox(height: themeData.spacing),
          PasswordFormField(
            validator: passwordValidator,
            onSaved: (value) {
              _password = value;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: i18n.password,
              errorMaxLines: 2,
            ),
          ),
          SizedBox(height: themeData.spacing),
          PasswordFormField(
            validator: passwordValidator,
            onSaved: (value) {
              _password = value;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: i18n.repeatPassword,
              errorMaxLines: 2,
            ),
          ),
          SizedBox(height: themeData.spacing * 2),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          themeData.colorScheme.primary),
                    ),
                    onPressed: () {
                      if (_loginFormKey.currentState?.validate() == true) {
                        _loginFormKey.currentState!.save();
                        logger.d(
                            "register, ${_phoneNumber?.format()}, $_password $_verificationCode");
                      }
                    },
                    child: Text(
                      i18n.register,
                      style: TextStyle(color: themeData.colorScheme.onPrimary),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
