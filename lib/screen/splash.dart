import 'package:flutter/material.dart';
import 'package:flutter_template/widgets/loading_spinner.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: a better splash screen
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Loading...'),
            SizedBox(height: 16),
            LoadingSpinner()
          ],
        ),
      ),
    );
  }
}
