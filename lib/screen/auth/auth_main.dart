import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harmony/harmony.dart';
import 'package:responsive_builder/responsive_builder.dart';

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

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.screenSize.shortestSide <
          ResponsiveSizingConfig.instance.breakpoints.tablet) {
        return content;
      }
      return SizedBox(
        width: 52.sw - themeData.spacing * 4,
        height: min(84.sw, 68.sh),
        child: content,
      );
    });

  }
}
