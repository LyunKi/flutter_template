import 'package:flutter/material.dart';
import 'package:harmony/harmony.dart';

class CountryListDemo extends StatelessWidget {
  const CountryListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ElevatedButton(
            onPressed: () {
              showGeneralDialog(
                  context: context,
                  transitionDuration: const Duration(milliseconds: 400),
                  pageBuilder: (a, b, c) {
                    return SizedBox.expand(
                      child: Container(
                        color: Colors.white70,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const FlutterLogo(
                                size: 200,
                              ),
                              const Text(
                                "This is a Full Screen Dialog",
                                style: TextStyle(
                                    fontSize: 20,
                                    decoration: TextDecoration.none),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Close"))
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: Text('test')),
        Expanded(child: PhoneNumberFormField())
      ],
    )
    );
  }
}
