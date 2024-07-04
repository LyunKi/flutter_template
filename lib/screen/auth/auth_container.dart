import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harmony/utils/logger.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'auth_logo.dart';
import 'auth_main.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.screenSize.shortestSide <
          ResponsiveSizingConfig.instance.breakpoints.tablet) {
        return LayoutBuilder(
            builder: (BuildContext _, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                    minWidth: viewportConstraints.maxWidth),
                child: const Column(children: [
                  AuthLogo(),
                  AuthMain(),
                ])),
          );
        });
      }

      return Center(
        child: SizedBox(
          width: 84.sw,
          height: min(84.sw, 68.sh),
          child: Card(
            child: Row(
              children: [AuthLogo(),VerticalDivider(), AuthMain()],
            ),
          ),
        ),
      );
    });
  }
}
