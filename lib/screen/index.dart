import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/main.dart';
import 'package:flutter_template/state/user.dart';
import 'package:go_router/go_router.dart';

class IndexScreen extends ConsumerWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userStateProvider);
    final themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text('Index Screen')),
      body: Center(
          child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: Theme.of(context).spacing,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.vertical,
        children: [
          const Text('You are in the Index Screen'),
          ElevatedButton(
            onPressed: () => context.push('/user'),
            child: const Text('Go to the User screen'),
          ),
          user.when(
              data: (data) => data != null
                  ? RichText(
                      text: TextSpan(
                      style: themeData.textTheme.bodySmall,
                      text: 'Hello, ${data.name}! Click ',
                      children: [
                        TextSpan(
                          text: 'here',
                          style: themeData.textTheme.bodySmall!.copyWith(
                            decoration: TextDecoration.underline,
                            color: themeData.colorScheme.primaryContainer,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ref.read(userStateProvider.notifier).logout();
                            },
                        ),
                        TextSpan(
                          style: themeData.textTheme.bodySmall,
                          text: ' to logout.',
                        ),
                      ],
                    ))
                  : RichText(
                      text: TextSpan(
                      text: 'Hello, you haven\'t login! Click ',
                      style: themeData.textTheme.bodySmall,
                      children: [
                        TextSpan(
                          text: 'here',
                          style: themeData.textTheme.bodySmall!.copyWith(
                            decoration: TextDecoration.underline,
                            color: themeData.colorScheme.primaryContainer,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go('/login');
                            },
                        ),
                        TextSpan(
                          style: themeData.textTheme.bodySmall,
                          text: ' to login.',
                        ),
                      ],
                    )),
              error: (err, stack) => const Text('error'),
              loading: () => const Text('loading'))
        ],
      )),
    ));
  }
}
