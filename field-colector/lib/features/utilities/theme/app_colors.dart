import 'package:flutter/material.dart';

/// Paleta de colores de la app (GEMS · cuaderno de campo digital).
class AppColors {
  AppColors._();

  // --- Base ---
  static const Color grassShadow = Color(0xFF2D5016);
  static const Color greenParasol = Color(0xFF3B6D11);
  static const Color cumulusBlue = Color(0xFF9FE1CB);
  static const Color wildYellow = Color(0xFFBA7517);
  static const Color cloudWhite = Color(0xFFF7F4ED);

  /// Panel auth / manual sobre crema.
  static const Color authBeige = cloudWhite;

  /// Relleno emblema botánico (splash).
  static const Color emblemFill = Color(0xFFEAF3DE);

  /// Badge institucional splash (Citesa Research).
  static const Color tealAccent = Color(0xFF5DCAA5);

  // --- Roles semánticos (cómo se USAN los colores) ---
  static const Color primary = greenParasol;
  static const Color primaryDark = grassShadow;
  static const Color secondary = cumulusBlue;
  static const Color accent = wildYellow;
  static const Color background = cloudWhite;
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFE24B4A);

  // --- Texto ---
  static const Color textOnPrimary = Colors.white;
  static const Color textPrimary = grassShadow;
  static const Color textSecondary = Color(0xFF888888);
  static const Color textMuted = Color(0xFFAAAAAA);
  static const Color hintText = Color(0xFFBBBBBB);
  static const Color errorText = Color(0xFFA32D2D);
  static const Color textOnError = Colors.white;

  // --- Semillero / tonos extendidos GEMS (manual, loading, auth) ---
  static const Color semilleroLightGreen = Color(0xFF97C459);
  static const Color semilleroDarkGreen = Color(0xFF1E3A0A);
  static const Color semilleroSkyBlue = Color(0xFF9FE1CB);
  static const Color semilleroDeepBlue = Color(0xFF639922);
  static const Color semilleroViolet = Color(0xFFC0DD97);
  static const Color semilleroMagenta = Color(0xFFBA7517);
  static const Color semilleroInk = Color(0xFF1E3A0A);

  /// Ciclo de color en etiqueta animada y secciones del manual.
  static const List<Color> semilleroCycle = [
    semilleroLightGreen,
    semilleroSkyBlue,
    semilleroViolet,
    semilleroMagenta,
    semilleroDarkGreen,
  ];
}
