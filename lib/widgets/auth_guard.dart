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

  const AuthGuard({
    super.key,
    required this.fallbackAction,
    required this.child,
    this.checker,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthGuardState();
}

class _AuthGuardState extends ConsumerState<AuthGuard> {
  Future<bool> _defaultChecker(User? maybeUser) async {
    return maybeUser != null;
  }

  void _fallback() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.fallbackAction();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateProvider);
    final realChecker = widget.checker ?? _defaultChecker;
    return user.isLoading
        ? const Scaffold(
            body: Center(child: LoadingSpinner()),
          )
        : FutureBuilder<bool>(
            future: realChecker(user.value),
            builder: (_, result) {
              if (!result.hasData ||
                  result.hasError ||
                  result.connectionState != ConnectionState.done) {
                return const LoadingSpinner();
              }
              if (!result.data!) {
                _fallback();
                return const LoadingSpinner();
              }
              return widget.child;
            },
          );
  }
}
