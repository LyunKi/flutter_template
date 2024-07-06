import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:harmony/harmony.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final i18n = AppLocalizations.of(context)!;
    return Column(
      children: [
        SizedBox(height: themeData.spacing),
        Container(
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: i18n.noAccount,
                  style: themeData.textTheme.bodyMedium),
              TextSpan(
                text: i18n.signUp,
                style: TextStyle(color: themeData.colorScheme.primary),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ]),
            softWrap: true,
          ),
        ),
        SizedBox(height: themeData.spacing),
        IntrinsicHeight(
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: i18n.clickToConfirm,
                  style: themeData.textTheme.bodyMedium),
              TextSpan(
                text: i18n.terms,
                style: TextStyle(
                    color: themeData.colorScheme.primary,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(text: i18n.and, style: themeData.textTheme.bodyMedium),
              TextSpan(
                text: i18n.privacy,
                style: TextStyle(
                    color: themeData.colorScheme.primary,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ]),
          ),
        ),
        SizedBox(height: themeData.spacing),
      ],
    );
  }
}

