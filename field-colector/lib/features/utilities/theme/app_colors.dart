import 'package:flutter/material.dart';

/// Paleta de colores de la app.
class AppColors {
  AppColors._();

  // --- Base ---
  static const Color grassShadow = Color(0xFF2A3B2E);
  static const Color greenParasol = Color(0xFF548C5B);
  static const Color cumulusBlue = Color(0xFF85BCE4);
  static const Color wildYellow = Color(0xFFE0D466);
  static const Color cloudWhite = Color(0xFFF5F7F8);
  /// Panel auth (welcome / home curvo).
  static const Color authBeige = cloudWhite;

  // --- Roles semánticos (cómo se USAN los colores) ---
  static const Color primary = greenParasol;
  static const Color primaryDark = grassShadow;
  static const Color secondary = cumulusBlue;
  static const Color accent = wildYellow;
  static const Color background = cloudWhite;
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFD32F2F);

  // --- Texto ---
  static const Color textOnPrimary = cloudWhite;
  static const Color textPrimary = grassShadow;
  static const Color textSecondary = Color(0xFF5F7563);
  static const Color textOnError = Colors.white;

  // --- Semillero / Citesa Research (logo) ---
  static const Color semilleroLightGreen = Color(0xFF90C843);
  static const Color semilleroDarkGreen = Color(0xFF004B23);
  static const Color semilleroSkyBlue = Color(0xFF5BBFF2);
  static const Color semilleroDeepBlue = Color(0xFF1E73BE);
  static const Color semilleroViolet = Color(0xFF662D91);
  static const Color semilleroMagenta = Color(0xFF9E005D);
  static const Color semilleroInk = Color(0xFF0D1210);

  /// Orden del ciclo de color en etiqueta animada de bienvenida.
  static const List<Color> semilleroCycle = [
    semilleroLightGreen,
    semilleroSkyBlue,
    semilleroViolet,
    semilleroMagenta,
    semilleroDarkGreen,
  ];
}
