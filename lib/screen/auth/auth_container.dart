
import 'package:flutter/material.dart';
import 'package:harmony/harmony.dart';

import 'auth_logo.dart';
import 'auth_main.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext _, BoxConstraints viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
                minWidth: viewportConstraints.maxWidth),
            child: !isBigScreen()
                ? const Column(children: [
                    AuthLogo(),
                    AuthMain(),
                  ])
                : const Center(
                    child: Card(
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [AuthLogo(), VerticalDivider(), AuthMain()],
                        ),
                      ),
                    ),
                  )),
      );
    });
  }
}
