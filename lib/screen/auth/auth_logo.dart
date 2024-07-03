import 'package:flutter/material.dart';
import 'package:harmony/harmony.dart';


class AuthLogo extends StatelessWidget {
  const AuthLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      children: [
        SizedBox(
          height: themeData.spacing * 2,
        ),
        Container(
          child: Center(
            child: BrightnessAwareImage(
              "logo.png",
              height: themeData.logoSize,
              width: themeData.logoSize,
            ),
          ),
        ),
        SizedBox(
          height: themeData.spacing * 2,
        ),
      ],
    );
  }
}
