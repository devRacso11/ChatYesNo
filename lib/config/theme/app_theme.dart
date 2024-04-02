import 'package:flutter/material.dart';

const Color _customColor = Color(0x00F1B40D);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.redAccent,
  Colors.teal,
  Colors.pink,
  Colors.purple,
  Colors.orange,
  Colors.indigo,
  Colors.cyan,
];

class Apptheme {
  final int selectedColor;

  Apptheme({this.selectedColor = 0})
      : assert(
          selectedColor >= 0 && selectedColor  <= _colorThemes.length - 1,
          'Colors must be between 0 and ${_colorThemes.length}',
        );

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
