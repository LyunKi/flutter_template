import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harmony/harmony.dart';


class AuthThirdPartyLogin extends StatelessWidget {
  const AuthThirdPartyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final i18n = AppLocalizations.of(context)!;
    return Column(children: [
      TextDivider(
          label: i18n.orLogin,
          textStyle: themeData.textTheme.bodyMedium?.copyWith(
            color: themeData.colorScheme.secondary,
          )),
      SizedBox(height: themeData.spacing),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {},
              icon: BrightnessAwareImage(
                "github_logo.png",
                autoSwitch: true,
                width: themeData.iconSize,
                height: themeData.iconSize,
              )),
          IconButton(
              onPressed: () {},
              icon: BrightnessAwareImage("google_logo.png",
                  width: themeData.iconSize, height: themeData.iconSize)),
          IconButton(
              onPressed: () {},
              icon: BrightnessAwareImage("wechat_logo.png",
                  width: themeData.iconSize, height: themeData.iconSize))
        ],
      )
    ]);
  }
}
