import 'package:flutter/material.dart';
import 'package:harmony/harmony.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: themeData.spacing * 2,
        ),
        BrightnessAwareAsset(
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

    if (!isBigScreen()) {
      return content;
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: themeData.spacing * 4),
      child: content,
    );
  }
}
