import 'package:flutter/material.dart';
import 'package:themes/sreen_pizza.dart';

import 'glogabl_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Themes',
      theme: globalTehme(),
      home: const SreenPizzCalc(),
    );
  }
}
