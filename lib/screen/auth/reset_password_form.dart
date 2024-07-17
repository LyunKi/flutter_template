import 'package:flutter/material.dart';
import 'package:flutter_template/business/validators/string.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:harmony/harmony.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _loginFormKey = GlobalKey<FormState>();

  PhoneNumber? _phoneNumber;
  String? _password;

  PhoneNumber number = PhoneNumber.fromCca2Code(
      WidgetsBinding.instance.platformDispatcher.locale.countryCode);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            initialValue: number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: i18n.phoneNumber,
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
              labelText: i18n.password,
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
                            "reset, ${_phoneNumber?.format()}, $_password");
                      }
                    },
                    child: Text(
                      i18n.reset,
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
