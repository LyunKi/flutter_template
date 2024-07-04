import 'package:flutter/material.dart';
import 'package:harmony/harmony.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harmony/utils/logger.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final i18n = AppLocalizations.of(context)!;
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: themeData.spacing * 2,
        ),
        BrightnessAwareImage(
          "logo.png",
          autoSwitch: true,
          height: themeData.logoSize,
          width: themeData.logoSize,
        ),
        SizedBox(
          height: themeData.spacing * 2,
        ),
      ],
    );

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.screenSize.shortestSide <
          ResponsiveSizingConfig.instance.breakpoints.tablet) {
        return content;
      }
      return SizedBox(
        width: 32.sw,
        child: content,
      );
    });
  }
}
