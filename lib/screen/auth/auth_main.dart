import 'package:flutter/material.dart';
import 'package:harmony/harmony.dart';

import 'auth_footer.dart';
import 'auth_third_party_login.dart';
import 'login_by_password_form.dart';

class AuthMain extends StatelessWidget {
  const AuthMain({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: themeData.spacing * 2),
          child: Column(
            children: [
              const LoginByPasswordForm(),
              SizedBox(height: themeData.spacing * 2),
              const AuthThirdPartyLogin(),
              SizedBox(height: themeData.spacing * 2),
              Flexible(
                flex: 1,
                child: Container(),
              ),
              const AuthFooter()
            ],
          )),
    );
  }
}
