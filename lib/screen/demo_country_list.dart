import 'package:flutter/material.dart';
import 'package:harmony/country_list.dart';

class CountryListDemo extends StatelessWidget {
  const CountryListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CountryList()
    );
  }
}
