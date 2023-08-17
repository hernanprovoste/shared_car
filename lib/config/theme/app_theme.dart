import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.pink,
  Colors.red,
  Colors.greenAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be grater then 0'),
        assert(selectedColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
