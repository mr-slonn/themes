import 'package:flutter/material.dart';

ThemeData globalTehme() => ThemeData(
      fontFamily: 'Georgia',
      splashColor: Colors.blue,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
      ).copyWith(
        secondary: Colors.grey,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        headline3: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
        bodyText1: TextStyle(fontSize: 14, fontFamily: 'Hind'),
      ),
    );
