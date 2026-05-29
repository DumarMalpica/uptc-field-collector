import 'package:field_colector/features/auth/widgets/gems_design.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Tema para formularios GEMS sobre el cuerpo crema (login / registro).
///
/// Inputs blancos con borde verde pálido, etiquetas UPPERCASE renderizadas
/// por [GemsLabeledField] y CTA verde sólido. Sustituye al antiguo estilo
/// "frosted glass" sobre fondo verde.
class AuthFormTheme {
  AuthFormTheme._();

  // ── Paleta contextual ──────────────────────────────────
  static const Color titleColor = AppColors.primary;

  static const Color fieldTextColor = AppColors.textPrimary;
  static const Color inputLabelColor = AppColors.primary;
  static const Color fieldHintColor = AppColors.hintText;
  static const Color menuItemTextColor = AppColors.textPrimary;

  static const _fieldRadius = BorderRadius.all(
    Radius.circular(GemsDesign.fieldRadius),
  );

  // ── Helpers ────────────────────────────────────────────

  static OutlineInputBorder _border(Color color, {double width = 1}) =>
      OutlineInputBorder(
        borderRadius: _fieldRadius,
        borderSide: BorderSide(color: color, width: width),
      );

  // ── ThemeData override ─────────────────────────────────

  static ThemeData onGreen(ThemeData base) {
    final fieldInput = base.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      labelStyle: const TextStyle(color: inputLabelColor),
      floatingLabelStyle: const TextStyle(color: inputLabelColor),
      hintStyle: const TextStyle(color: fieldHintColor),
      helperStyle: const TextStyle(color: AppColors.textSecondary),
      errorStyle: const TextStyle(
        color: AppColors.errorText,
        fontSize: 9,
        height: 1.2,
      ),
      prefixIconColor: AppColors.textPrimary.withValues(alpha: 0.4),
      suffixIconColor: AppColors.textPrimary.withValues(alpha: 0.4),
      border: _border(AppColors.semilleroViolet),
      enabledBorder: _border(AppColors.semilleroViolet),
      focusedBorder: _border(AppColors.semilleroDeepBlue, width: 1.5),
      disabledBorder: _border(AppColors.semilleroViolet.withValues(alpha: 0.5)),
      errorBorder: _border(AppColors.error),
      focusedErrorBorder: _border(AppColors.error, width: 1.5),
    );

    final text = base.textTheme;
    return base.copyWith(
      textTheme: text.copyWith(
        titleLarge: text.titleLarge?.copyWith(color: titleColor),
        titleMedium: text.titleMedium?.copyWith(color: titleColor),
        bodyLarge: text.bodyLarge?.copyWith(color: AppColors.textPrimary),
        bodyMedium: text.bodyMedium?.copyWith(color: AppColors.textPrimary),
        bodySmall: text.bodySmall?.copyWith(color: AppColors.textSecondary),
      ),
      inputDecorationTheme: fieldInput,
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: const TextStyle(color: fieldTextColor, fontSize: 14),
        inputDecorationTheme: fieldInput,
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      progressIndicatorTheme: base.progressIndicatorTheme.copyWith(
        color: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.semilleroDeepBlue,
          textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primary,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GemsDesign.ctaRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          disabledForegroundColor: Colors.white,
          disabledBackgroundColor: AppColors.semilleroViolet,
        ),
      ),
    );
  }

  // ── Per-field decoration factory ───────────────────────

  /// Decoración de campo blanco con borde verde. El placeholder llega por
  /// [hintText]; las etiquetas se renderizan arriba con [GemsLabeledField].
  /// [borderColor] permite reflejar estados de validación (válido / error).
  static InputDecoration fieldDecoration({
    String? hintText,
    String? helperText,
    String? errorText,
    Widget? suffixIcon,
    Color? borderColor,
  }) {
    final border = borderColor == null
        ? null
        : OutlineInputBorder(
            borderRadius: _fieldRadius,
            borderSide: BorderSide(color: borderColor, width: 1.5),
          );
    return InputDecoration(
      hintText: hintText,
      helperText: helperText,
      errorText: errorText,
      suffixIcon: suffixIcon,
      enabledBorder: border,
      focusedBorder: border,
    );
  }
}
