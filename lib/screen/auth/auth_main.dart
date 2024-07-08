import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/l10n/app_localizations.dart';
import 'package:flutter_template/screen/auth/auth_state.dart';
import 'package:flutter_template/screen/auth/register_form.dart';
import 'package:flutter_template/screen/auth/reset_password_form.dart';
import 'package:harmony/harmony.dart';

import 'auth_footer.dart';
import 'auth_third_party_login.dart';
import 'login_by_password_form.dart';

class AuthMain extends ConsumerWidget {
  const AuthMain({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);
    final i18n = AppLocalizations.of(context);
    final authType = ref.watch(authTypeProvider);
    final content = Padding(
        padding: EdgeInsets.symmetric(horizontal: themeData.spacing * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Font Family
            Text(i18n!.welcome,
                style: themeData.textTheme.titleLarge?.copyWith(
                    fontFamily: 'LXGWWenKaiMonoGB',
                    fontWeight: FontWeight.bold)),
            SizedBox(height: themeData.spacing * 4),
            switch (authType) {
              AuthType.loginByPassword => const LoginByPasswordForm(),
              AuthType.resetPassword => const ResetPasswordForm(),
              AuthType.register => const RegisterForm(),
            },
            SizedBox(height: themeData.spacing * 2),
            const AuthThirdPartyLogin(),
            SizedBox(height: themeData.spacing * 2),
            const AuthFooter(),
          ],
        ));

    if (!isBigScreen()) {
      return content;
    }
    return SizedBox(
      width: min(420, 100.sw - themeData.spacing * 16 - themeData.logoSize),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 8.sh, horizontal: themeData.spacing * 2),
        child: content,
      ),
    );
  }
}
