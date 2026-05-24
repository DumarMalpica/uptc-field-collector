import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Tema para formularios sobre fondo verde (login / registro).
///
/// Paleta pensada para armonizar con el fondo [AppColors.primary]
/// usando campos semi-translúcidos ("frosted glass") en vez de
/// rellenos opacos que rompen la continuidad cromática.
class AuthFormTheme {
  AuthFormTheme._();

  // ── Paleta contextual ──────────────────────────────────
  static const Color titleColor = AppColors.accent;

  static const Color _fieldFill = Color(0x26FFFFFF); // white 15 %
  static const Color _borderIdle = Color(0x40FFFFFF); // white 25 %
  static const Color _borderFocused = Color(0x80FFFFFF); // white 50 %
  static const Color _borderDisabled = Color(0x1AFFFFFF); // white 10 %

  static const Color fieldTextColor = Colors.white;
  static const Color inputLabelColor = Color(0xCCF5F7F8); // cloudWhite 80 %
  static const Color fieldHintColor = Color(0x80F5F7F8); // cloudWhite 50 %
  static const Color menuItemTextColor = AppColors.primaryDark;

  static const _fieldRadius = BorderRadius.all(Radius.circular(12));

  // ── Helpers ────────────────────────────────────────────

  static OutlineInputBorder _border(Color color, {double width = 1.2}) =>
      OutlineInputBorder(
        borderRadius: _fieldRadius,
        borderSide: BorderSide(color: color, width: width),
      );

  // ── ThemeData override ─────────────────────────────────

  static ThemeData onGreen(ThemeData base) {
    final fieldInput = base.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: _fieldFill,
      labelStyle: const TextStyle(color: inputLabelColor),
      floatingLabelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      hintStyle: const TextStyle(color: fieldHintColor),
      helperStyle: const TextStyle(color: fieldHintColor),
      prefixIconColor: inputLabelColor,
      suffixIconColor: inputLabelColor,
      border: _border(_borderIdle),
      enabledBorder: _border(_borderIdle),
      focusedBorder: _border(_borderFocused, width: 1.8),
      disabledBorder: _border(_borderDisabled),
      errorBorder: _border(AppColors.error),
      focusedErrorBorder: _border(AppColors.error, width: 1.8),
    );

    final text = base.textTheme;
    return base.copyWith(
      textTheme: text.copyWith(
        titleLarge: text.titleLarge?.copyWith(color: titleColor),
        titleMedium: text.titleMedium?.copyWith(color: titleColor),
        bodyLarge: text.bodyLarge?.copyWith(color: Colors.white),
        bodyMedium: text.bodyMedium?.copyWith(color: inputLabelColor),
        bodySmall: text.bodySmall?.copyWith(color: fieldHintColor),
      ),
      inputDecorationTheme: fieldInput,
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: const TextStyle(color: fieldTextColor, fontSize: 16),
        inputDecorationTheme: fieldInput,
        menuStyle: MenuStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.authBeige),
          surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      listTileTheme: base.listTileTheme.copyWith(
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        iconColor: titleColor,
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return titleColor;
          return Colors.white.withValues(alpha: 0.6);
        }),
      ),
      progressIndicatorTheme: base.progressIndicatorTheme.copyWith(
        color: titleColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white.withValues(alpha: 0.85),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryDark,
          backgroundColor: AppColors.accent,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: _fieldRadius),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          disabledForegroundColor: AppColors.primaryDark.withValues(alpha: 0.4),
          disabledBackgroundColor: AppColors.accent.withValues(alpha: 0.3),
        ),
      ),
    );
  }

  // ── Per-field decoration factory ───────────────────────

  static InputDecoration fieldDecoration({
    required String labelText,
    String? hintText,
    String? helperText,
    String? errorText,
    Widget? suffixIcon,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      helperText: helperText,
      errorText: errorText,
      suffixIcon: suffixIcon,
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
    );
  }
}
