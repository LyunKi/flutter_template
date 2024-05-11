import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/state/user.dart';
import 'package:flutter_template/widgets/loading_spinner.dart';

typedef Checker = Future<bool> Function(User? maybeUser);

class AuthGuard extends ConsumerStatefulWidget {
  final Function fallbackAction;
  final Widget child;
  final Checker? checker;
  final Widget? placeholder;

  const AuthGuard({
    super.key,
    required this.fallbackAction,
    required this.child,
    this.checker,
    this.placeholder,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthGuardState();
}

class _AuthGuardState extends ConsumerState<AuthGuard> {
  Future<bool> _defaultChecker(User? maybeUser) async {
    return maybeUser != null;
  }

  void _fallback() {
    widget.fallbackAction();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateProvider);
    final realChecker = widget.checker ?? _defaultChecker;
    final realPlaceholder = widget.placeholder ??
        const Scaffold(
            body: Center(child: LoadingSpinner()),
        );
    return user.isLoading
        ? realPlaceholder
        : FutureBuilder<bool>(
            future: realChecker(user.value),
            builder: (_, result) {
              if (!result.hasData ||
                  result.hasError ||
                  result.connectionState != ConnectionState.done) {
                return Container();
              }
              if (!result.data!) {
                _fallback();
                return Container();
              }
              return widget.child;
            },
          );
  }
}
