import 'package:flutter/material.dart';
import 'package:material_color_generator/material_color_generator.dart';

abstract class AppColors {
  static Color color5B6975 = const Color(0xff5B6975);
  static Color textField = const Color(0xff152A3A);
  static Color lightTheme = const Color(0xffE5E5E5);
  static Color dartTheme = const Color(0xff0B1E2D);
  static Color cardStatusAlive = const Color(0xff43D049);
  static Color cardStatusDead = const Color(0xffEB5757);
  static Color cardName = const Color(0xffFFFFFF);
  static Color cardInfo = const Color(0xff6E798C);
  static Color iconsActiveColor = const Color(0xff43D049);
  static Color iconsNotActiveColor = const Color(0xff5B6975);
  static Color text = const Color(0xff22A2BD);

//themeDark/Light
  static ThemeData dark = ThemeData(
    primarySwatch: generateMaterialColor(
      color: const Color(0xff0B1E2D),
    ),
    scaffoldBackgroundColor: const Color(0xff0B1E2D),
  );
  static ThemeData light = ThemeData(
    primarySwatch: generateMaterialColor(
      color: const Color(0xffE5E5E5),
    ),
    scaffoldBackgroundColor: const Color(0xffE5E5E5),
  );
}
