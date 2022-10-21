import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

abstract class TextStyles {
  static TextStyle nunito16w400 = GoogleFonts.nunito(
    color: StyleColor.skipButtonColor,
    fontSize: 16,
    letterSpacing: 0.41,
    fontWeight: FontWeight.w400,
  );

  static TextStyle nunito40w700 = GoogleFonts.nunito(
    color: StyleColor.titleScreenText,
    fontSize: 40,
    letterSpacing: 0.37,
    fontWeight: FontWeight.w700,
  );
}
