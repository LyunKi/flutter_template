import 'package:flutter/material.dart';

class OauthScreen extends StatefulWidget {
  const OauthScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OauthScreenState();
}

class _OauthScreenState extends State<OauthScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: themeData.colorScheme.surface,
        body: SafeArea(child: Container()));
  }
}
