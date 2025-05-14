import 'package:flutter/material.dart';

const colorList = <Color> [
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.teal,
  Colors.pink,
  Colors.brown,
  Colors.cyan,
  Colors.indigo,
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >= 0, 'Selected color must be greater then 0'),
      assert(selectedColor < colorList.length, 'Selected color must be less than ${colorList.length-1}');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(
      centerTitle: true,
    )
  );
}