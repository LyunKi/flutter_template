import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harmony/harmony.dart';

import 'auth_footer.dart';
import 'auth_third_party_login.dart';
import 'login_by_password_form.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final content = Padding(
        padding: EdgeInsets.symmetric(horizontal: themeData.spacing * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginByPasswordForm(),
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
        padding: EdgeInsets.symmetric(vertical: 8.sh, horizontal: themeData.spacing * 2 ),
        child: content,
      ),
    );
  }
}
