import 'package:flutter/material.dart';

class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const offWhite = Color(0xFFF5F6F7);
  static const grey = Color(0xFFB0B8C7);
  static const lightGrey = Color(0xFFE5E5E5);
  static const green = Color(0xFF159F6E);
  static const yellow = Color(0xFFF7A61B);
  static const red = Color(0xFFE4362B);
  static const black = Color(0xFF3D3D38);
  static const blue = Color(0xFF366FC6);
  static const turqoise = Color(0xFF40A0CD);
  static const brown = Color(0xFF994A32);
  static const purple = Color(0xFFBA43F5);
  static const pink = Color(0xFFF544D7);

  static Color getColorForType(String type) {
    Map<String, Color> _colorByTypes = {
      "normal": Color(0xFFA8A77A),
      "fire": Color(0xFFEE8130),
      "water": Color(0xFF6390F0),
      "electric": Color(0xFFF7D02C),
      "grass": Color(0xFF7AC74C),
      "ice": Color(0xFF96D9D6),
      "fighting": Color(0xFFC22E28),
      "poison": Color(0xFFA33EA1),
      "ground": Color(0xFFE2BF65),
      "flying": Color(0xFFA98FF3),
      "psychic": Color(0xFFF95587),
      "bug": Color(0xFFA6B91A),
      "rock": Color(0xFFB6A136),
      "ghost": Color(0xFF735797),
      "dragon": Color(0xFF6F35FC),
      "dark": Color(0xFF705746),
      "steel": Color(0xFFB7B7CE),
      "fairy": Color(0xFFD685AD),
    };

    var color = _colorByTypes[type];

    if (color == null) {
      return Colors.white;
    }

    return color;
  }
}
