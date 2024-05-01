import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/state/user.dart';
import 'package:go_router/go_router.dart';

void dump(dynamic object, dynamic context) {
  String str = '';

  if (object is! String) {
    String strObject = '';

    if (object is Map) {
      strObject = jsonEncode(object);
    } else {
      strObject = object.toString();
    }

    str += ' $strObject';
  } else {
    str += ' $object';
  }

  if (context != null) {
    String strContext = '';

    if (context is! String) {
      if (context is Map) {
        strContext = jsonEncode(context);
      } else {
        strContext = context.toString();
      }
    }

    str += ' $strContext';
  }

  print(str);
}

class IndexScreen extends ConsumerWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userStateProvider);
    dump(Theme.of(context), context);
    return Scaffold(
      appBar: AppBar(title: const Text('Index Screen')),
      body: SafeArea(
        child: Center(
            child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: Theme.of(context).visualDensity.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: [
            const Text('You are in the Index Screen'),
            ElevatedButton(
              onPressed: () => context.go('/user'),
              child: const Text('Go to the User screen'),
            ),
            user.when(
                data: (data) => data != null
                    ? RichText(
                        text: TextSpan(
                        text: 'Hello, ${data.name}! Click ',
                        children: [
                          TextSpan(
                            text: 'here',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(
                            text: ' to logout.',
                          ),
                        ],
                      ))
                    : RichText(
                        text: TextSpan(
                        text: 'Hello, you haven\'t login! Click ',
                        children: [
                          TextSpan(
                            text: 'here',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Theme.of(context).primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(
                            text: ' to login.',
                          ),
                        ],
                      )),
                error: (err, stack) => const Text('error'),
                loading: () => const Text('loading'))
          ],
        )),
      ),
    );
  }
}
