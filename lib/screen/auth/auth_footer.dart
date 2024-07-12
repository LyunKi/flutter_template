import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:flutter_template/screen/auth/auth_state.dart';
import 'package:harmony/harmony.dart';

class SignUpTip extends StatelessWidget {
  const SignUpTip({
    super.key,
    required this.i18n,
    required this.themeData,
    required this.onSignUp,
  });

  final AppLocalizations i18n;
  final ThemeData themeData;
  final GestureTapCallback onSignUp;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: i18n.noAccount, style: themeData.textTheme.bodyMedium),
        TextSpan(
          text: i18n.signUp,
          style: TextStyle(color: themeData.colorScheme.primary),
          recognizer: TapGestureRecognizer()..onTap = onSignUp,
        ),
      ]),
    );
  }
}

class LoginTip extends StatelessWidget {
  const LoginTip({
    super.key,
    required this.i18n,
    required this.themeData,
    required this.onLogin,
  });

  final AppLocalizations i18n;
  final ThemeData themeData;
  final GestureTapCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: [
        TextSpan(text: i18n.hasAccount, style: themeData.textTheme.bodyMedium),
        TextSpan(
          text: i18n.loginNow,
          style: TextStyle(color: themeData.colorScheme.primary),
          recognizer: TapGestureRecognizer()..onTap = onLogin,
        ),
      ]),
    );
  }
}

class AuthFooter extends ConsumerWidget {
  const AuthFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);
    final i18n = AppLocalizations.of(context)!;
    final authType = ref.watch(authTypeProvider);
    onSignUp() => ref.read(authTypeProvider.notifier).state = AuthType.register;
    onLogin() =>
        ref.read(authTypeProvider.notifier).state = AuthType.loginByPassword;
    return Column(
      children: [
        switch (authType) {
          AuthType.register =>
            LoginTip(i18n: i18n, themeData: themeData, onLogin: onLogin),
          AuthType.loginByPassword => SignUpTip(
              i18n: i18n,
              themeData: themeData,
              onSignUp: onSignUp,
            ),
          AuthType.resetPassword => SignUpTip(
              i18n: i18n,
              themeData: themeData,
              onSignUp: onSignUp,
            ),
        },
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
